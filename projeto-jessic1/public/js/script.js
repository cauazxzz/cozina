// Abre o modal e preenche os campos com os dados do usuário
const editBtns = document.querySelectorAll('.edit-btn');
const modal = document.getElementById('editModal');
const closeModalBtn = document.getElementById('closeModal');
const editForm = document.getElementById('editForm');

editBtns.forEach(btn => {
    btn.addEventListener('click', function(e) {
        e.preventDefault();

        // Preencher os campos do modal com os dados do usuário
        document.getElementById('userId').value = this.getAttribute('data-id');
        document.getElementById('nome').value = this.getAttribute('data-nome');
        document.getElementById('email').value = this.getAttribute('data-email');

        // Mostrar o modal
        modal.style.display = 'block';
    });
});

// Fechar o modal
closeModalBtn.addEventListener('click', function() {
    modal.style.display = 'none';
});

// Enviar o formulário via AJAX
editForm.addEventListener('submit', function(e) {
    e.preventDefault();

    const formData = new FormData(this);

    fetch('../src/functions/edit-user.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Usuário atualizado com sucesso!');
                location.reload(); // Recarregar a página para refletir as mudanças
            } else {
                alert('Erro ao atualizar usuário.');
            }
        })
        .catch(error => {
            alert('Erro: ' + error.message);
        });
});