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
      It is ${this.getDaysBetween(countDownToDate, this.currentTime)} days, 
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
    return Math.round(this.timeLeftInMS(greaterDate, smallerDate) / 86400000);
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
