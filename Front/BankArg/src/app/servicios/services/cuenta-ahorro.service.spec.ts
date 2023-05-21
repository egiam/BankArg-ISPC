import { TestBed } from '@angular/core/testing';

import { CuentaAhorroService } from './cuenta-ahorro.service';

describe('CuentaAhorroService', () => {
  let service: CuentaAhorroService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CuentaAhorroService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
