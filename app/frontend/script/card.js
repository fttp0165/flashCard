document.addEventListener('turbolinks:load',()=>{
    const btn=document.querySelector('.like_btn')
    if(btn){
      btn.addEventListener("click",(e)=>{
      e.preventDefault()//暫停目前行為重新監聽事件
      // get page csrf token
      const token =document.querySelector('meta[name=csrf-token]').content
      const cardId=e.currentTarget.dataset.cardId
      const icon=e.target
  
      console.log(cardId)
      const ax = require('axios');
      ax.defaults.headers.common['X-CSRF-TOKEN'] = token;
      ax.post(`/cards/${cardId}/like`)
      .then(function (resp) {
        if(resp.data.status == "0")
        {
          icon.classList.remove('far')
          icon.classList.add('fas')
          console.log(icon)
        }else{
          icon.classList.remove('fas')
          icon.classList.add('far')
        }
      })
      .catch(function (error) {
        console.log("------------");
        console.log(error);
      })
  

      })
    }
});
