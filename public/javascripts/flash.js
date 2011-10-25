;jQuery(function($) {

  /** method to animate flash hide */
  $.fn.flashHide = function(callback) {
    // slide up
    this.animate({ top: this.outerHeight() * -1 }, $.e9.flash.speed, 'linear', callback);
  }

  /** method to animate flash show */
  $.fn.flashShow = function(callback) {
    // slide down
    this.css('top', -9999).show();
    var h = this.outerHeight();
    this
      //.css('top', h * -1)
      .animate({ top: 0 }, $.e9.flash.speed, 'linear', callback)
    ;
  }
});
