const checked = require('./app/Task/Images/checked@2x.png');
const unchecked = require('./app/Task/Images/unchecked@2x.png');

const active = require('./app/Control/Images/active@2x.png');
const all = require('./app/Control/Images/all@2x.png');
const completed = require('./app/Control/Images/completed@2x.png');
const hamburger = require('./app/Control/Images/hamburger@2x.png');

const _ohanhi$elm_native_ui$Native_Image = function () {
  const images = { checked, unchecked, active, all, completed, hamburger };
  function loadImage(imageName) {
    return images[imageName];
  }

  return {
    loadImage,
  };
}();
