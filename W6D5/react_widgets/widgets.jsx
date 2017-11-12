import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';

const arrTabs = [{title: 'Cat Pics', content: 'Cats'},
								{title: 'Corgi Pics', content: 'Corgis'},
								{title: 'Slow loris Pics', content: 'Pygmies'}];

document.addEventListener("DOMContentLoaded", () => {
	const root = document.getElementById("root");
	ReactDOM.render(<div>
		<Clock/><br/>
		<Tabs arrTabs={arrTabs}/>
		</div>,
		root);
});
