;jQuery(function($) {
  /*
   * add offer class handler to quick_edit.
   */
  $.quick_edit = $.quick_edit || {};
  $.quick_edit.class_handlers = $.extend({
    'offer' : function(el) {
      var path   = el.attr('data-renderable-path'), 
          npath  = el.attr('data-update-node-path'),
          epath  = path + '/edit';

      //return '<a class="qe-qelink" href="'+ epath +'">Edit</a>' +
      return '<a class="qe-ulink"  href="'+ npath +'">Switch</a>' +
             '<a class="qe-elink"  href="'+ epath +'">Admin</a>';
    }
  }, $.quick_edit.class_handlers);

  /* 
   *
   */
  $('.dated-costs a.new-resource').click(function(e) {
    e.preventDefault();

    var $this = $(this);

    $.ajax({
      url: $this.attr('href'),
      dataType: 'json',
      success: function(data) {
        $(data.html).insertBefore($this.closest('.actions'));
      }
    });
  });

  $("#campaign_code_field input").keyup(function() {
    $.event.trigger('campaign_code_change', [$(this).val()]);
  });

  $("#campaign_code_hint").bind("campaign_code_change", function(e, code) {
    $(this).html(function(i, v) {
      return v.replace(/=(.*)$/, '='+code);
    });
  });

  var selector_prefix = 'body.controller-e9-crm-contacts', 
      $selector       = $(selector_prefix);

  /*
   * The status of "primary" for a User login is stored on the individual records, but must be exlcusive in
   * the scope of the Contact (only one User may be primary).
   */

  $.fn.exclusiveCheck = function() {
    var selector = $(this);

    return this.each(function(i) {
      var $this = $(this);

      if (! $this.data('excl') ) {
        $this.click(function(e) {
          var clicked = this;
          if (this.checked) {
            $this.data('excl').each(function() {
              if (this != clicked) this.checked = false;
            });
          }
        });
      }

      $this.data('excl', selector);
    });
  }

  var rsel = '.nested-association input[type=radio][name$="[primary]"]',
     $rsel = $(rsel);

  if (!$rsel.is(':checked')) { $rsel.first().attr('checked', true); }

  /* wrapped in live to ensure dynamic added fields get the function */
  $(rsel).live('click', function() {
    if (!$(this).data('excl')) {
      $(rsel).exclusiveCheck();
      $(this).click();
    }
  });

  var email_regex = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i;

  $('.contact-email input', $selector).live('blur', function() {
    var 
    $el     = $(this), 
    email   = $el.val(),
    $md     = $('#merge-dialog'),
    buttons = {},
    action,
    data,
    id,
    existin = $el
      .closest('.record-attribute')
      .siblings('.record-attribute')
      .find('.contact-email input')
      .map(function(i, el){ return $(el).val(); });

    if (_.include(existin, email)) {
      $('#duplicate-dialog').dialog({
        close: function() { $el.val(''); },
        resizable: false,
        modal: true,
        buttons: {
          'Ok': function() { $(this).dialog("close"); }
        }
      });
    } else if (email_regex.test(email)) { 
      data = 'email='+email;
      id   = $md.attr('data-id');

      if (id) { data+='&id='+id; }

      $.ajax({
        url: '/users/email_test.json',
        data: data,
        success: function(data) {
          if (data.url) {
            action = id ? 'Yes, merge now' 
                        : 'Yes, edit now';

            buttons[action] = function() {
              window.location.href = data.url;
            }

            buttons['Cancel'] = function() {
              $( this ).dialog( "close" );
            }

            $md.dialog({
              close: function() { $el.val(''); },
              resizable: false,
              modal: true,
              buttons: buttons
            });
          }
        }
      });
    }
  });

  $('#contact_email_form', $selector).live('submit', function(e) {
    e.preventDefault();

    var $f = $(this);

    if ($f.attr('data-count') == '0') {
      alert($f.attr('data-empty'));
      $f.undisable();
      return false;
    }

    $.ajax({
      url: $f.attr('action'),
      data: $f.serializeArray(),
      type: 'get',
      success: function(data) {
        $.colorbox({ html: data });
      }
    });
  });

  $('form#contact_search_form', $(selector_prefix))
    .live('submit', function(e) {
      e.preventDefault();

      $.extend($.query, {
        'search': $(this).find('input[name=search]').val()
      });

      $.submit_with_query();
    })
    .each(function(i, el) {
      $('input[type=text]', el).val($.query['search'] || '');
    })
  ;

  $('input#contact_search_clear', $(selector_prefix))
    .live('click', function(e) {

      $(selector_prefix)
        .find('select').val('').end()
        .find('input[type=text]').val('').end()
        .find('#contact_tag_select').html('').end()
        .find('input[type=checkbox]').attr('checked', false).end()
      ;

      $.query = {};

      $.submit_with_query();
    })
  ;
    

  /*
   * contact mailto links have template functionality, passing the contact and user (login) 
   * for the email to the email templates form, which offers the available templates and
   * on submit, will return the template in its rendered form for population of a mailto.
   *
   * See below handling of the form.
   */
  $('a.contact-mailto')
    .click(function(e) {
      e.preventDefault();
    })
    .each(function(i, el) {
      var $el = $(el);
      $el.qtip({
        content: {
          title: {
            text: 'Send Contact Email',
            button: true
          },
          text: '<img src="/images/spinner.gif" />',
          ajax: {
            url: '/admin/email/templates/select',
            dataType: 'script',
            data: {
              contact_id: $el.attr('data-contact-id'),
              user_id: $el.attr('data-user-id')
            }
          }
        }, 
        position: {
           at: 'bottom center', // Position the tooltip above the link
           my: 'top center'
        },
        show: {
           event: 'click',
           solo: true // Only show one tooltip at a time
        },
        hide: 'unfocus',

        // TODO this should use e9 tooltip style
        style: {
           classes: 'ui-tooltip-wiki ui-tooltip-light ui-tooltip-shadow'
        }
      })
    })
  ;

  /*
   * Behavior for the email template select form.
   *
   * It should intercept the submit and redirect itself to email_templates#show.json
   * passing along the user_id and contact_id sent with the request.
   *
   * On success, it should take the json returned (the rendered email template data) and 
   * build a mailto href which is then opened in a new window.
   */
  $('form.email-template-sel').live('submit', function(e) {
    e.preventDefault();

    var $t = $(this), 
        $s = $t.find('select'),
        $c = $t.find('> input[type=hidden]');

    $.ajax({
      url: $t.attr('action')+'/'+$s.val()+'/personalize',
      type: 'GET',
      dataType: 'json',
      data: $.param($c),
      success: function(data, status, xhr) {
        var   to = data.to,
            subj = escape(data.subject),
            body = escape(data.text_body);

        var href = 'mailto:' + to + '?subject=' + subj + '&body=' + body;

        // attempt to close our tooltip
        try { $t.closest('.ui-tooltip').qtip('api').hide(); } catch(e) {}

        // open mailto in new window
        window.open(href, '_blank');
      }
    });
  });

  //$('.ui-tooltip .email-template-sel-close').live('click', function() {
    //$(this).closest('.ui-tooltip').qtip('api').hide();
  //});

  /*
   * Single contact autocomplete (not select/list widget)
   */
  $('.contact-autocomplete')
    .bind('keypress', function(e) {
      if (e.keyCode == 13) e.preventDefault();
    })
    .autocomplete({
      delay: 400,
      source: '/autocomplete/contacts',

      // on select, add the template (code is in widgets.js) and
      // clear the input field
      select: function(e, ui) {
        $(this)
          .hide().val('')
          .next('.contact-select')
          .setContactSelectValues(ui.item.value, ui.item.id)
          .show()
        ;
        return false;
      }
    })
  ;

  $('.contact-select a').click(function(e) {
    e.preventDefault();
    $(this)
      .closest('.contact-select')
        .hide()
        .setContactSelectValues('', null)
        .prev('.contact-autocomplete').show()
    ;
  });

  $.fn.setContactSelectValues = function(text, id) {
    $('.content', this).html(text);
    $('input', this).val(id).change();
    return this;
  }

  $(".email-campaign-autocomplete:not(.ui-autocomplete-input)").live("focus", function (event) {
    $(this)
      .autocomplete({
        source: '/autocomplete/email_campaigns',
        delay: 400
      })
      .bind('keypress', function(e) {
        if (e.keyCode == 13) e.preventDefault();
      })
    ;
  });

  /*
   * Contact autocomplete
   */
  var $contact_autocomplete = $('#contact_autocomplete');
  //var search_cache = {};

  $contact_autocomplete
    // stop enter from submitting our form
    .bind('keypress', function(e) {
      if (e.keyCode == 13) e.preventDefault();
    })
    .autocomplete({
      delay: 400,

      // on select, add the template (code is in widgets.js) and
      // clear the input field
      select: function(e, ui) {
        $contact_autocomplete
          .add_select_template(ui.item.value, ui.item.id)
          .val('');

       // return false to prevent autocomplete from filling the field
       return false;
      },
      source: function(request, response) {

        var data = 'query=' + request.term, 
            excl = $contact_autocomplete.attr('data-values');

        // add 'except' ids if they exist in values.
        if (excl.length) data += '&except=' + excl;

        $.ajax({
          url: "/autocomplete/contacts",
          dataType: "json",
          data: data,
          success: function(data) {
            // caching code, not impl
            //search_cache.term = request.term;
            //search_cache.content = data;
            response(data);
          }
        });
      }
    })
  ; 

  var $company_autocomplete = $('#contact_company_name');

  $company_autocomplete
    .autocomplete({
      delay: 400,
      focus: function(e, ui) {
        $company_autocomplete.val(ui.item.value);
        return false;
      },
      source: function(request, response) {
        $.ajax({
          url: "/autocomplete/companies",
          dataType: "json",
          data: request,
          success: function(data) {
            // caching code, not impl
            //search_cache.term = request.term;
            //search_cache.content = data;
            response(data);
          }
        });
      }
    })
  ; 

  //$('ul.tags', $selector).change(function(e) {
    //$.extend($.query, {
      //'tagged[]': $.makeArray($(this).find('input[type=checkbox]').map(function(i, el) { return $(el).attr('checked') ? $(el).val() : null }))
    //});

    //$.submit_with_query();
  //});

  var $tag_autocomplete = $('#contact_tag_autocomplete'),
      $tag_select       = $('#contact_tag_select');

  var get_tags = function() {
    return $.makeArray($('.content', $tag_select).map(function(i, el){ return $(el).html() }));
  }

  var tag_update = function() {
    $.extend($.query, { 'tagged[]': get_tags() });

    $.submit_with_query();
  }

  /* this is in addition to the usual select.list click */
  $('a', $tag_select).live('click', function(e) {
    e.preventDefault();
    _.defer(tag_update);
  });

  $tag_autocomplete
    .blur(function() { 
      $(this).val('');
    })
    .autocomplete({
      delay: 350,
      source: function(request, response) {
        var request_str = "term=" + request.term + "&context=Users*";

        if ($.query['tagged[]']) {
          request_str += '&' + $.param({ except: $.query['tagged[]'] });
        }
        
        $.ajax({
          url: "/autocomplete/tags",
          dataType: "json",
          data: request_str,
          success: function(data) {
            var tags = get_tags();

            response(_.select(data, function(obj, i) {
              return !_.include(tags, obj.value);
            }));
          }
        });
      },
      select: function(evt, ui) {
        $tag_autocomplete.add_select_template(ui.item.value, ui.item.value);
        $tag_autocomplete.val('').blur();
        tag_update();
        return false;
      },
      focus: function(evt, ui) {
        $tag_autocomplete.val(ui.item.value);
        return false;
      }
    })
  ;

  $('.renderable form.new_deal').live('submit', function(e) {
    e.preventDefault();

    var $f = $(this);

    // if the validator has not been defined
    if (!$f.data('validator')) {

      // define it, including an ajax submit handler
      $f.validate({
        onclick: false,
        onfocusout: false,
        onkeyup: false,
        errorClass: 'field_with_errors',
        errorElement: 'div',
        submitHandler: function(v) {
          $f.callRemote();
        }
      });

      // then re-submit, to the now validated form
      $f.submit();
    }
  });
});
