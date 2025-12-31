document.addEventListener('click', function (event) {
  const toasts = document.querySelectorAll('.js-toast');

  // 🔒 Se não existir toast, não faz nada
  if (toasts.length === 0) return;

  toasts.forEach(toast => {
    if (!toast.contains(event.target)) {
      toast.classList.add('animate__fadeOutUp');

      setTimeout(() => {
        toast.remove();
      }, 300);
    }
  });
});