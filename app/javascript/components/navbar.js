document.addEventListener('turbo:load', function() {
  function closeDropdowns(e) {
    if (!e.target.closest('.dropdown') && !e.target.closest('.dropdown-menu')) {
      document.querySelectorAll('.dropdown-menu.show').forEach(menu => {
        menu.classList.remove('show');
      });
    }
  }

  // Remover listener antigo para não duplicar
  document.removeEventListener('click', closeDropdowns);

  if (window.innerWidth < 768) {
    document.addEventListener('click', closeDropdowns);
  }
});
