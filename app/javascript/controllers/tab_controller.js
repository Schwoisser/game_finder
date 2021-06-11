import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["tabs","buttons"];

    connect() {
    }
    switch(){
      console.log("After Break")
      const tab_number = event.currentTarget.dataset["tabNumber"]
      console.log(tab_number)
      console.log(this.tabsTargets)
      console.log(this.buttonsTargets)

      for (let index = 0; index < this.tabsTargets.length; index++) {
        const element = this.tabsTargets[index]; 
        console.log(element)
        if(index == tab_number){
          // element.classList.remove('hidden')  
          $(element).fadeIn(300)
        }else{
          // element.classList.add('hidden')  
          $(element).fadeOut(300)
        }
      }
      
      for (let index = 0; index < this.buttonsTargets.length; index++) {
        const element = this.buttonsTargets[index];
        console.log(element)
        if(index == tab_number){
          element.classList.remove('bg-gray-200')  
        }else{
          element.classList.add('bg-gray-200')  
        }
      }
    } 


    fade_out(body){
          opacity =
          Number(window.getComputedStyle(body).getPropertyValue("opacity"))
  
            if(opacity>0){
                   opacity=opacity-0.1;
                           body.style.opacity=opacity
            }
            else{
                clearInterval(intervalID); 
            }
        } 
    fade_in(body){
      opacity =
      Number(window.getComputedStyle(body).getPropertyValue("opacity"))

        if(opacity<1){
               opacity=opacity+0.1;
                       body.style.opacity=opacity
        }
        else{
            clearInterval(intervalID); 
        }
    }

  }