class Clock {

  constructor() {
    const j = new Date();

    this.hours = j.getHours();
    this.minutes = j.getMinutes();
    this.seconds = j.getSeconds();

    this.printTime();
    setInterval(this._tick.bind(this), 1000);
  }


  printTime() {
    const nowTime = `${this.padded(this.hours)} : ${this.padded(this.minutes)} : ${this.padded(this.seconds)}`;
    console.log(nowTime);
  }

  _tick() {
    this.incrementSeconds();
    this.printTime();
  }

  incrementSeconds() {
    this.seconds += 1;
    if (this.seconds === 60) {
      this.incrementMinutes();
      this.seconds = 0;
    }
  }
  // ++ x, x++, x+=1
  // Clock.seconds === this.seconds?
  incrementMinutes() {
    this.minutes +=1 ;
    if (this.minutes === 60){
      this.incrementHours();
      this.minutes = 0;
    }
  }

  incrementHours() {
    this.hours = (this.hours + 1) % 24;

  }

  padded(num) {
    if (num.toString().length === 1) {
      return (`0${num}`);
    }
    else
      return (num);
  }


}


const clock = new Clock();
