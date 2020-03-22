import { Component } from '@angular/core';

// This is a pretty generic component added for test purposes
// this is another comment line
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'A simple Angular 7.2 project that requires an http server to play embeded videos';
  localClickCounter = 0;

  giveYouUp() {
    alert('I did not give you up');
    this.localClickCounter++;
  }

  letYouDown() {
    alert('I did not let you down');
    this.localClickCounter--;
  }

  runAroundAdnDesert() {
    alert('I did not run around...');
    this.localClickCounter !== 0 ?
       this.localClickCounter *= 2 :
       this.localClickCounter = 1000;
  }
}
