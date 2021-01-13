if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('item-preview');
    
      // イベント発火
      document.getElementById('item-image').addEventListener('change', function(e){

        // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContent = document.querySelector('.address');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      // 画像を表示するためのdiv要素を生成
     const imageElement = document.createElement('div');
     imageElement.className = 'product';

     // 表示する画像を生成
     const blobImage = document.createElement('img');
     blobImage.className = 'address';
     blobImage.setAttribute('src', blob);

     // 生成したHTMLの要素をブラウザに表示させる
     imageElement.appendChild(blobImage);
     ImageList.appendChild(imageElement);


    });
  });
};
