# Ejercicios 3:
### Escribir en YAML la siguiente estructura de datos en JSON: 

* JSON:

```
{ uno: "dos", tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }
```

```
{
  uno: "dos",
  tres: [
    4,
    5,
    "Seis",
    {
      siete: 8,
      nueve: [
        10,
        11
      ]
    }
  ]
}
```

Las listas se pueden usar introduciendo un miembro por línea antepuesto con "- " o introduciéndolos entre "[]" separados por ", ". Los arrays asociativos se pueden usar introduciendo un miembro en formato para "clave: valor" por línea o introduciéndolos entre "{}" separados por ", ".

* YAML:

```
---
{uno: "dos", tres: [4, 5, "Seis", {siete: 8, nueve: [10, 11] } ] }
```

```
---
- uno: "dos"
  tres:
    - 4
    - 5
    - "Seis"
    -
      - siete: 8
        nueve: 
          - 10
          - 11
```

Para los playbooks que vamos a crear para usar con Ansible, lo más comodo es usar listas de arrays asociativos.
