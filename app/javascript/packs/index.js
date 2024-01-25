import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router } from 'react-router-dom';
import NavigationBar from '../components/Navigation';
import App from '../components/App'

const root = ReactDOM.createRoot(document.getElementById('navigation'))
root.render(<App/>)