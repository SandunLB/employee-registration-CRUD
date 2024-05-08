 function enableEditing(cell) {
            var input = document.createElement('input');
            input.type = 'text';
            input.value = cell.innerText.trim();
            input.style.width = '100%';
            input.style.border = 'none';
            input.style.padding = '6px';
            input.style.boxSizing = 'border-box';
            cell.innerHTML = '';
            cell.appendChild(input);
            input.focus();

            input.addEventListener('blur', function() {
                cell.innerText = input.value;
            });

            input.addEventListener('keydown', function(event) {
                if (event.key === 'Enter') {
                    cell.innerText = input.value;
                }
            });
        }

        function updateRecord(id) {
			
			alert("Employee ID:" +id + " Data Has been Updated" );
			
            var row = document.getElementById('row-' + id);
            var form = document.createElement('form');
            form.setAttribute('method', 'POST');
            form.setAttribute('action', 'update'); 

            var data = {};
            data.id = id;

            var cells = row.querySelectorAll('.editable');
            cells.forEach(function(cell) {
                var fieldName = cell.getAttribute('data-field');
                var input = document.createElement('input');
                input.setAttribute('type', 'hidden');
                input.setAttribute('name', fieldName);
                input.setAttribute('value', cell.innerText.trim());
                form.appendChild(input);
                data[fieldName] = cell.innerText.trim();
                
                
            });

            var csrfTokenInput = document.querySelector('input[name=_csrf]');
            if (csrfTokenInput) {
                var csrfToken = csrfTokenInput.value;
                var csrfInput = document.createElement('input');
                csrfInput.setAttribute('type', 'hidden');
                csrfInput.setAttribute('name', '_csrf');
                csrfInput.setAttribute('value', csrfToken);
                form.appendChild(csrfInput);
            }

            document.body.appendChild(form);
            form.submit();
        }

        function openForm() {
            document.getElementById("addForm").style.display = "block";
        }

        function closeForm() {
            document.getElementById("addForm").style.display = "none";
        }