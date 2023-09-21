import cytoscape from "cytoscape"

document.addEventListener('DOMContentLoaded', () => {
    fetch('/data.json')
    .then(response => response.json())
    .then(data => {
        var cy = cytoscape({
            container: document.getElementById('cy'),
            elements: data,
            style: [
                {
                    selector: 'node',
                    style: {
                        'background-color': '#666',
                        'label': 'data(id)'
                    }
                },
                {
                    selector: 'edge',
                    style: {
                        'width': 3,
                        'line-color': '#ccc',
                        'target-arrow-color': '#ccc',
                        'target-arrow-shape': 'none',
                        'curve-style': 'bezier'
                    }
                },
            ],
            
        });
    });
})
