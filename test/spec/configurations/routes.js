'use strict';

describe('Service: routes', function () {

  // load the service's module
  beforeEach(module('emergencyApp'));

  // instantiate service
  var routes;
  beforeEach(inject(function (_routes_) {
    routes = _routes_;
  }));

  it('should do something', function () {
    expect(!!routes).toBe(true);
  });

});
