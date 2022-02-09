$(function(){
  var $container = $('.js-masonry-container');   //コンテナとなる要素を指定

  $container.imagesLoaded(function(){ //imagesLoadedを使用し、画像が読み込みまれた段階でMasonryの関数を実行させる

    $container.masonry({
        itemSelector: '.js-masonry-item',
        columnWidth: '.js-masonry-sizer',
    });
  });
});
