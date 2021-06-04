import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["steps","proceed", "previous", "submit"];

    connect() {
        // this.element.textContent = "Hello World!"
        // console.log("This Form connected = SUCCESS!!!!!!!!!!! :D");
        // console.log(this.stepsTargets);
        // for (let index = 0; index < this.stepsTargets.length; index++) {
        //     const element = this.stepsTargets[index];
        //     console.log(element.className.includes("hidden"))
        //     element.hidden=false
        // }
        // console.log(this.proceedTarget)
        // this.longitudeTarget.value = "test";
    }

    next(){
        this.previousTarget.classList.remove('hidden')
        for (let index = 0; index < this.stepsTargets.length; index++) {
            const element = this.stepsTargets[index];
            if (index == (this.stepsTargets.length-2)) {
                this.proceedTarget.classList.add('hidden')
                this.submitTarget.classList.remove('hidden')
                // break
            }
            console.log(element.className.includes("hidden"))
            if (index==(this.stepsTargets.length-1)) {
                this.proceedTarget.classList.add('hidden')
                break                
            }
            if (!element.className.includes("hidden")) {
                element.classList.add('hidden');
                this.stepsTargets[index + 1].classList.remove('hidden');
                break
                console.log("After Break")
            }
            // element.hidden=true
        }
    }
    
    back(){
        for (let index = 0; index < this.stepsTargets.length; index++) {
            const element = this.stepsTargets[index];            
            console.log(element.className.includes("hidden"))
            if (index == (this.stepsTargets.length - 1)) {
                this.proceedTarget.classList.remove('hidden')
                this.submitTarget.classList.add('hidden')                
            }
            if (!element.className.includes("hidden")) {
                element.classList.add('hidden');
                this.stepsTargets[index - 1].classList.remove('hidden');
                if (index == 1){
                    this.previousTarget.classList.add('hidden')

                }
                break
                console.log("After Break")
            }
        }

    }

}
