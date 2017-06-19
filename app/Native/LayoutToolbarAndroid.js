const _ohanhi$elm_native_ui$Native_LayoutToolbarAndroid = function () {
  const React = require('react');
  const { DrawerLayoutAndroid } = require('react-native');
  const ToolbarAndroid = require('ToolbarAndroid');
  const TouchableHighlight = require('TouchableHighlight');

  let androidDrawer = null; // maybe make a "ref" solution

  const DrawerLayoutAndroidWrapper = (props) =>
    <DrawerLayoutAndroid
      {...props}
      ref={  (drawer) => { androidDrawer = drawer; } }
      drawerPosition={DrawerLayoutAndroid.positions.Left}
    />;

  const ToolbarAndroidWrapper = (props) =>
    <ToolbarAndroid
      {...props}
      onIconClicked={ () => { androidDrawer.openDrawer(); } }
    />;

  const ClosingTouchableHighlight = ({onPress, ...otherProps}) =>
    <TouchableHighlight
      {...otherProps}
      onPress={ () => { androidDrawer.closeDrawer(); onPress(); } }
    />

  return {
    drawerLayoutAndroidView: DrawerLayoutAndroidWrapper,
    toolbarAndroidView: ToolbarAndroidWrapper,
    closingTouchableHighlightView: ClosingTouchableHighlight,
  };
}();
