import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TransferenciasListaComponent } from './transferencias-lista.component';

describe('TransferenciasListaComponent', () => {
  let component: TransferenciasListaComponent;
  let fixture: ComponentFixture<TransferenciasListaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TransferenciasListaComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TransferenciasListaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
