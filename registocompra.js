document.getElementById("buyBtn").addEventListener("click", function() {
    const libros = [
        { nombre: "El Principito", archivo: "Libros/el_principito_edincr.pdf" },
        { nombre: "Cien Años de Soledad", archivo: "Libros/Cien Años De Soledad.pdf" },
        { nombre: "1984", archivo: "Libros/1984.pdf" }
    ];

    const bibliotecaDiv = document.getElementById("buyBtn");

    libros.forEach(libro => {
        let enlace = document.createElement("a");
        enlace.href = libro.archivo;
        enlace.download = libro.nombre;
        enlace.textContent = `Descargar ${libro.nombre}`;
        enlace.style.display = "block"; 
        bibliotecaDiv.appendChild(enlace);
    });
    });

