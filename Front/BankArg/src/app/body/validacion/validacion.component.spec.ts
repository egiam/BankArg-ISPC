import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ValidacionComponent } from './validacion.component';

describe('ValidacionComponent', () => {
  let component: ValidacionComponent;
  let fixture: ComponentFixture<ValidacionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ValidacionComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ValidacionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
