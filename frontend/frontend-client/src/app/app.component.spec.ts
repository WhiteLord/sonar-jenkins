import { TestBed, async } from '@angular/core/testing';
import { RouterTestingModule } from '@angular/router/testing';
import { AppComponent } from './app.component';

describe('AppComponent', () => {
  const title = 'A simple Angular 7.2 project that requires an http server to play embeded videos';
  beforeEach(async(() => {
    TestBed.configureTestingModule({
      imports: [
        RouterTestingModule
      ],
      declarations: [
        AppComponent
      ],
    }).compileComponents();
  }));

  it(`should have as title 'A simple Angular 7.2 project...'`, () => {
    const fixture = TestBed.createComponent(AppComponent);
    const app = fixture.debugElement.componentInstance;
    expect(app.title).toEqual(title);
  });

  it('should render title in a h1 tag', () => {
    const fixture = TestBed.createComponent(AppComponent);
    fixture.detectChanges();
    const compiled = fixture.debugElement.nativeElement;
    expect(compiled.querySelector('h1').textContent).toContain('Angular 7.2');
  });

  it('should calculate value of local counter when never gonna give you up is pressed', () => {
    const fixture = TestBed.createComponent(AppComponent);
    fixture.detectChanges();
    const compiled = fixture.debugElement.nativeElement;
    // finds and clicks the first <a> tag bound to doStuff()
    compiled.querySelector('button').click();
    // finds and clicks the second <a> tag bound to doOtherStuff()
    // compiled.querySelector('#doOtherStuff').click();
    fixture.detectChanges();
    expect(fixture.componentInstance.localClickCounter).toEqual(1);
  });

});