function preview() {
  const postForm = document.getElementById('item-image')

  const previewList = document.getElementById('previews')

  if (!postForm) return null
  const fileField = document.querySelector('input[type="file"][name="item[image]"]');
  // input要素で値の変化が起きた際に呼び出される関数
  fileField.addEventListener('change', function(e){
    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };
    const file = e.target.files[0]
    const blob = window.URL.createObjectURL(file)
    const previewWrapper = document.createElement('div')
    const previewImage = document.createElement('img')

    previewWrapper.setAttribute('class', 'preview')
    previewImage.setAttribute('class', 'preview-image')
    previewImage.setAttribute('src', blob)
    previewImage.style.maxWidth = '300px'; // 幅を最大300pxに制限
    previewImage.style.maxHeight = '250px'; // 高さを最大250pxに制限
    previewWrapper.appendChild(previewImage)
    previewList.appendChild(previewWrapper)
  })

}

window.addEventListener(`turbo:load`, preview)
  