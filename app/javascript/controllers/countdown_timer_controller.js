import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="countdown-timer"
export default class extends Controller {
  static values = {
    upcomingDateTimestamp: Number,
    tomorrowDateTimestamp: Number,
  };
  static targets = ["timerDisplayer"];

  connect() {
    let upcomingDate = new Date(this.upcomingDateTimestampValue);
    this.timer(upcomingDate);
  }

  // private
  timer(countDownToDate) {
    setInterval(() => {
      this.currentTime = new Date();
      let tomorrowDate = new Date(this.tomorrowDateTimestampValue);

      this.timerDisplayerTarget.textContent = `
      Next lunch is ${this.getDaysBetween(countDownToDate, this.currentTime)} days, 
            ${this.getHoursBetween(tomorrowDate, this.currentTime)} hours, 
            ${this.getMinutesBetween(
              this.getNextHour(),
              this.currentTime
            )} minutes and 
            ${this.getSecondsBetween(
              this.getNextMinute(),
              this.currentTime
            )} seconds away.`;
    }, 1000);
  }

  getDaysBetween(greaterDate, smallerDate) {
    // When I am not substracting by one, before 12pm I am not going to 
    // get the correct_days_between. 
    // I am going to get (correct_days_between + 1)
    // This is because I am rounding up, so
    // 3.69 is going to be 4.
    return Math.round(this.timeLeftInMS(greaterDate, smallerDate) / 86400000) - 1;
  }

  getHoursBetween(greaterDate, smallerDate) {
    return Math.round(this.timeLeftInMS(greaterDate, smallerDate) / 3600000);
  }

  getMinutesBetween(greaterDate, smallerDate) {
    return Math.floor(this.timeLeftInMS(greaterDate, smallerDate) / 60000);
  }

  getSecondsBetween(greaterDate, smallerDate) {
    return Math.floor(this.timeLeftInMS(greaterDate, smallerDate) / 1000);
  }

  timeLeftInMS(greaterDate, smallerDate) {
    return greaterDate - smallerDate;
  }

  getNextHour() {
    let refTime = new Date();
    return refTime.setHours(this.currentTime.getHours() + 1, 0, 0);
  }

  getNextMinute() {
    let refTime = new Date();
    return refTime.setMinutes(this.currentTime.getMinutes() + 1, 0, 0);
  }
}
