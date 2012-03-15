;jQuery(function($) {

  /* 
   * code to run now and on ajax completion; dom manipulation, etc.
   */
  var iAjax;(iAjax= function() {
    /* adding link icons */
    $("a.social-link, .action-link")
      .not(':has(.img)')
      .wrapInner('<div class="text"/>')
      .prepend('<div class="img"/>')
    ;

    $('.destroy-nested-association, .datetime-picker-clear').button({
      icons: { primary: 'ui-icon-close' }, 
      text: false
    });
  })();
  $(document).ajaxComplete(iAjax);

  /* insert ">" between breadcrumbs */
  $("ul.breadcrumbs > li:not(:first-child)").before('<li class="gt"> &gt; </li>');

  $.e9.tooltips({
    defaults: {
      style: { classes: 'ui-tooltip-light', tip: { corner: false } },
    }
  });

  $('#content-top .headlines').cycle({
    fx: 'scrollRight',
    timeout: 6500
  });


  $('li.search').each(function(i, el) {
    var f = $('form', el); 

    f.search_form();

    $('a', el).toggle(
      function() {f.fadeIn()},
      function() {f.fadeOut()}
    );
  });
});
