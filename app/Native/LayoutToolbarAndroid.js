const _ohanhi$elm_native_ui$Native_LayoutToolbarAndroid = function () {
  const React = require('react');
  const DrawerLayoutAndroid = require('DrawerLayoutAndroid');
  const ToolbarAndroid = require('ToolbarAndroid');

  let androidDrawer = null; // maybe make a "ref" solution

  const DrawerLayoutAndroidWrapper = (props) =>
    <DrawerLayoutAndroid
      {...props}
      ref={(drawer) => { androidDrawer = drawer; }}
    />;

  const ToolbarAndroidWrapper = (props) =>
    <ToolbarAndroid
      {...props}
      onIconClicked={() =>  androidDrawer.openDrawer() }
    />;

  return {
    toolbarAndroidView: ToolbarAndroidWrapper,
    drawerLayoutAndroidView: DrawerLayoutAndroidWrapper,
  };
}();