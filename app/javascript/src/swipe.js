if(location.pathname == '/boards') {
  $(function () {
    let allCards = document.querySelectorAll('.swipe--card');

    let swipeContainer = document.querySelector('.swipe');

    // スワイプしていない時の画像たちの表示設定
    function initCards() {
      // スワイプしたカード：`.removed`なカードは表示しない
      let newCards = document.querySelectorAll('.swipe--card:not(.removed)');
      
      newCards.forEach(function (card, index) {
        card.style.zIndex = allCards.length - index;
        card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
        card.style.opacity = (10 - index) / 10;
      });

      if (newCards.length == 0) {
        $(".no-board").addClass("is-active");
      }
    }
    initCards();

    // スワイプ開始〜終了の一連の処理
    allCards.forEach(function (el) {
      let hammertime = new Hammer(el);

      // スワイプ開始・している最中の処理
      // panでタッチドラッグの操作を記述する
      hammertime.on('pan', function (event) {
        if (event.deltaX === 0) return;
        if (event.center.x === 0 && event.center.y === 0) return;

        el.classList.add('moving');

        // スワイプ時にハート / バツを表示する
        swipeContainer.classList.toggle('swipe_like', event.deltaX > 0);    // ハート：なければ表示 or あれば除去
        swipeContainer.classList.toggle('swipe_dislike', event.deltaX < 0); // バツの表示 or 除去

        let xMulti = event.deltaX * 0.03;
        let yMulti = event.deltaY / 80;
        let rotate = xMulti * yMulti;

        event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)';
      });

      // スワイプ後の処理
      // panendでタッチドラッグが終わった時の処理を記述する。
      hammertime.on('panend', function (event) {
        el.classList.remove('moving');
        swipeContainer.classList.remove('swipe_like');
        swipeContainer.classList.remove('swipe_dislike');

        let moveOutWidth = document.body.clientWidth;

        let keep = Math.abs(event.deltaX) < 200
        event.target.classList.toggle('removed', !keep);

        // reactionsコントローラーにlike or dislike を送信
        let reaction = event.deltaX > 0 ? "like" : "dislike";

        // Math.abs(event.deltaX) < 200でtransform空白
        if (keep) {
          event.target.style.transform = '';
        } else { // スワイプさせきって画像を画面外へ
          let endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth) + 100;
          let toX = event.deltaX > 0 ? endX : -endX;
          let endY = Math.abs(event.velocityY) * moveOutWidth;
          let toY = event.deltaY > 0 ? endY : -endY;
          let xMulti = event.deltaX * 0.03;
          let yMulti = event.deltaY / 80;
          let rotate = xMulti * yMulti;
          
          postReaction(el.id, reaction);

          // 画像の挙動を指定する
          event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)';

          // 最後にカードの表示を更新する
          initCards();
        }
      });
    });

    function postReaction(board_id, reaction) {
      $.ajax({
        url: "reactions.json",
        type: "POST",
        datatype: "json",
        data: {
          board_id: board_id,
          reaction: reaction,
        }
      })
      .done(function () {
        console.log("done!")
      })
    }

    // スワイプではなくボタンでの操作を記述
    function createButtonListener(reaction) {
      let cards = document.querySelectorAll('.swipe--card:not(.removed)');

      if (!cards.length) return false;

      let moveOutWidth = document.body.clientWidth * 2;

      let card = cards[0];
      let board_id = card.id;

      postReaction(board_id, reaction);
      card.classList.add('removed');

      if (reaction == "like") {
        card.style.transform = 'translate(' + moveOutWidth + 'px, -100px) rotate(-30deg)';
      } else {
        card.style.transform = 'translate(-' + moveOutWidth + 'px, -100px) rotate(30deg)';
      }

      initCards();
    }

    $('#like').on('click', function() {
      createButtonListener("like");
    })

    $('#dislike').on('click', function() {
      createButtonListener("dislike");
    })

  });
}
