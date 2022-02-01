$(function(){
  var $container = $('.js-masonry-container');   //コンテナとなる要素を指定

  $container.imagesLoaded(function(){ //imagesLoadedを使用し、画像が読み込みまれた段階でMasonryの関数を実行させる

    $('.js-masonry-container').masonry({
        itemSelector: '.js-masonry-item',
        columnWidth: '.js-masonry-sizer',
        percentPosition: true
    });
  });
});
