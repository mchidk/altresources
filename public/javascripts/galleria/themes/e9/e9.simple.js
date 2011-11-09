(function($) {

Galleria.addTheme({
    name: 'simple',
    author: 'Travis',
    version: '1.4',
    css: 'e9.simple.css',
    defaults: {
        thumb_crop: 'height',
        _toggle_info: true,
        image_position: "29px 1px"
    },
    init: function(options) {
        
        // add some elements
        this.addElement('info-link');
        this.append({
            'info' : ['info-link']
        });
        
        // cache some stuff
        var toggle   = this.$('image-nav-left,image-nav-right,counter'),
            info     = this.$('info'),
            infotext = this.$('info-text'),
            click    = Galleria.MOBILE ? 'touchstart' : 'click';
        
        this.$('loader').show().css('opacity',.4);
        
        // toggle info
        if ( options._toggle_info ) {
            info.toggle(
                function() { infotext.slideDown(); },
                function() { infotext.slideUp();   }
            );
        }
        
        this.bind(Galleria.LOADSTART, function(e) {
            if (!e.cached) {
                this.$('loader').show().fadeTo(200, .4);
            }
            
            this.$('info').toggle( this.hasInfo() );
            
            $(e.thumbTarget).css('opacity', 1).parent().siblings().children().css('opacity', 0.6);
        });
        
        this.bind(Galleria.LOADFINISH, function(e) {
            this.$('loader').fadeOut(200);
        });
    }
});

})(jQuery);
