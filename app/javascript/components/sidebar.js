// Controle do sidebar mobile
document.addEventListener('turbo:load', function() {
  const sidebar = document.getElementById('accordionSidebar');
  const sidebarToggle = document.querySelector('.sidebar-toggle');
  const sidebarOverlay = document.querySelector('.sidebar-overlay');
  const closeSidebarBtn = document.querySelector('.btn-close-sidebar');
  
  // Case de Segurança
  if (!sidebar) return;
  
  // Abrir sidebar
  if (sidebarToggle) {
    sidebarToggle.addEventListener('click', function() {
      sidebar.classList.add('active');
      sidebarOverlay.classList.add('active');
    });
  }
  
  // Fechar sidebar pelo overlay
  if (sidebarOverlay) {
    sidebarOverlay.addEventListener('click', function() {
      sidebar.classList.remove('active');
      this.classList.remove('active');
    });
  }
  
  // Fechar sidebar pelo botão de fechar
  if (closeSidebarBtn) {
    closeSidebarBtn.addEventListener('click', function() {
      sidebar.classList.remove('active');
      sidebarOverlay.classList.remove('active');
    });
  }
  
  // Fechar sidebar ao clicar em um link (opcional para mobile)
  const sidebarLinks = document.querySelectorAll('.sidebar .nav-link');
  sidebarLinks.forEach(link => {
    link.addEventListener('click', function() {
      if (window.innerWidth < 992) {
        sidebar.classList.remove('active');
        sidebarOverlay.classList.remove('active');
      }
    });
  });
  
  // Fechar sidebar ao redimensionar para desktop
  function handleResize() {
    if (window.innerWidth >= 992) {
      sidebar.classList.remove('active');
      if (sidebarOverlay) {
        sidebarOverlay.classList.remove('active');
      }
    }
  }
  
  window.addEventListener('resize', handleResize);
  handleResize(); // Executa uma vez ao carregar
});
