import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["toggled"];

    connect() {
      // for (let index = 0; index < this.toggledTargets.length; index++) {
      //   const element = this.toggledTargets[index]; 
      //   console.log(element)
      // }
    }

    toggle() {
      console.log("toggle")
      for (let index = 0; index < this.toggledTargets.length; index++) {
        const element = this.toggledTargets[index]; 
        // console.log(element)
        $(element).toggleClass("hidden");
      }
    }
}