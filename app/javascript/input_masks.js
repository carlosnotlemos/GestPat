document.addEventListener('DOMContentLoaded', function() {
  const element = document.getElementById('checked_at');
  if (element && window.IMask) {
    IMask(element, { mask: "00/0000" });
  }
});
