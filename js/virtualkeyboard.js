// js/virtualkeyboard.js
(function () {

  // REAL DEVICE CHECK
  // Phones usually have small screens — kiosk touchscreens do NOT.
  function isRealPhone() {
    const maxDim = Math.max(window.screen.width, window.screen.height);
    const isTouch = 'ontouchstart' in window;
    const ua = navigator.userAgent || "";

    const phoneUA = /Android|iPhone|iPad|iPod/i.test(ua);

    // Phones normally have < 900px longest side
    const looksSmall = maxDim < 900;

    return phoneUA && looksSmall && isTouch;
  }

  // Expose new API
  window.DeviceCheck = {
    isRealPhone
  };

  // Native VK API
  const vk = (navigator && navigator.virtualKeyboard) ? navigator.virtualKeyboard : null;
  const supports = !!vk;

  function safeCall(fn) {
    try { fn(); } catch (e) {}
  }

  function showNativeKeyboardFor(el) {
    if (!el) return;

    if (supports) {
      safeCall(() => {
        if (typeof vk.overlaysContent !== "undefined") {
          vk.overlaysContent = true;
        }
      });
      safeCall(() => vk.show && vk.show());
    }

    el.focus();
  }

  function hideNativeKeyboard() {
    if (!supports) return;
    safeCall(() => vk.hide && vk.hide());
  }

  window.VKShim = {
    vk,
    supports,
    showNativeKeyboardFor,
    hideNativeKeyboard
  };

})();
