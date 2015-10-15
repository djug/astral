var riot = require("riot");
var $ = require("jquery");
var app = require("../../resources/assets/js/tags/loginscreen.tag");
describe("the login-screen tag", function(){
  var tag;
  var html;
  beforeEach(function(){
    html = document.createElement("login-screen");
    document.body.appendChild(html);
    tag = riot.mount("login-screen")[0];
  });
  afterEach(function(){
    tag.unmount();
  });
  it("mounts the login-screen tag", function(){
    expect(tag.isMounted).toBe(true);
    expect( $("login-screen").length ).toBe(1);
  });
});
