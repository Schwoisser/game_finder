import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["started_at", "timer"];

  connect() {
    console.log("timer")
    console.log(this.started_atTarget)
    console.log(this.started_atTarget.innerHTML)

    var countDownDate = new Date(this.started_atTarget.innerHTML).getTime();
    console.log("countDownDate")
    console.log(countDownDate)

    var real_this = this
// Update the count down every 1 second
  var x = setInterval(function() {

    // Get today's date and time
    var now = new Date().getTime();

    // Find the distance between now and the count down date
    var distance = now - countDownDate;

    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Display the result in the element with id="demo"
    // console.log(real_this.started_atTarget)
    $(real_this.timerTarget).text(days + "d " + hours + "h "
    + minutes + "m " + seconds + "s ");

    // If the count down is finished, write some text
    if (distance < 0) {
      clearInterval(x);
      document.getElementById("demo").innerHTML = "EXPIRED";
    }
  }, 1000);
  }
}