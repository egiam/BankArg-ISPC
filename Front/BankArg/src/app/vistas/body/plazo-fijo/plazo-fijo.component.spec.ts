import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PlazoFijoComponent } from './plazo-fijo.component';

describe('PlazoFijoComponent', () => {
  let component: PlazoFijoComponent;
  let fixture: ComponentFixture<PlazoFijoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PlazoFijoComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PlazoFijoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
