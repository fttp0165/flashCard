// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import Rails from "@rails/ujs"
export default class extends Controller {
  static targets = [ 'thumb']

  like(e) {
 
    e.preventDefault()
    const cardId=this.data.get('cardId')
    // e.currentTarget.dataset
    // this.thumbTarget.remove()
    // console.log('like')
    
    Rails.ajax({
      url: `/cards/${cardId}/like`,
      type: 'post',
      success: (resp)=> {
        console.log(resp);
        if (resp.status == "0") {
          // 黑
          this.thumbTarget.classList.remove('far')
          this.thumbTarget.classList.add('fas')
        } else {
          // 白
          this.thumbTarget.classList.remove('fas')
          this.thumbTarget.classList.add('far')
        }
      },
      error: function(err) {
        console.log(err);
      }
    })
  }
}
