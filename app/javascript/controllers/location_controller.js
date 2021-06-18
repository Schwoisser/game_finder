import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "longitude", "latitude"];

  connect() {
    // this.element.textContent = "Hello World!"
    // console.log("hello location controller");
    // console.log(this.longitudeTarget);
    // this.longitudeTarget.value = "test";
  }

  getLocation() {
    event.preventDefault();
    console.log(this)
    let that = this;
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position){
        // console.log("Your current position is (" + "Latitude: " + position.coords.latitude + ", " + "Longitude: " + position.coords.longitude + ")");
        that.longitudeTarget.value = position.coords.longitude;
        that.latitudeTarget.value = position.coords.latitude;
      });
    } else {
        alert("Sorry, your browser does not support HTML5 geolocation.");
    }
  }
}
