const _ohanhi$elm_native_ui$Native_LayoutToolbarAndroid = function () {
  const React = require('react');
  const { DrawerLayoutAndroid } = require('react-native');
  const ToolbarAndroid = require('ToolbarAndroid');

  let androidDrawer = null; // maybe make a "ref" solution

  const DrawerLayoutAndroidWrapper = (props) =>
    <DrawerLayoutAndroid
      {...props}
      ref={
        (drawer) => {
          console.log("ref started");
          androidDrawer = drawer;
        }
      }
      drawerPosition={DrawerLayoutAndroid.positions.Left}
    />;

  const ToolbarAndroidWrapper = (props) =>
    <ToolbarAndroid
      {...props}
      onIconClicked={
        () => {
          console.log("icon clicked");
          androidDrawer.openDrawer();
        }
      }
    />;

  console.log("stuff stuff stuff")

  return {
    drawerLayoutAndroidView: DrawerLayoutAndroidWrapper,
    toolbarAndroidView: ToolbarAndroidWrapper,
  };
}();