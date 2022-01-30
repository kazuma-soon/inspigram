window.addEventListener('load', () => {
  const uploader = document.querySelector('.js-uploader');
  uploader.addEventListener('change', (e) =>{
    const file = uploader.files[0];
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => {
      const image = reader.result;
      document.querySelector('.js-default_image').setAttribute('src', image);
    }
  });
});