window.addEventListener('load', () => {


let canvas = document.getElementById('draw-area');
let ctx = canvas.getContext('2d');
const pictureUpload = document.getElementById('js-pictureUpload');

// クリックしたら発火
pictureUpload.addEventListener('click', async ()=> {
  // blobオブジェクトの作成
  let imageBlob = await new Promise(resolve => canvas.toBlob(resolve, 'image/png'));
  // FormDateオブジェクトの作成
  let formData = new FormData();

  // <input type="file"> のようにフィールドを追加
  // 第一引数はparamsで受け取るための名前。post[picture]とすることでストロングパラメータを使用して受け取る。
  formData.append("board[board_image]", imageBlob, "picture.png");
  // CSRF対策
  const token = document.getElementsByName("csrf-token")[0].content;
  // データを送信(ここでCreateアクションを実行させる)
  let response = await fetch('/boards', {
    method: 'POST',
    headers: {'X-CSRF-Token': token},
    body: formData
  });
  // 送信後、一覧画面に移動します。
  let location =  window.location.replace('/boards/mine');
});

});