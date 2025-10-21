import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["icon"]
  
  connect() {
    this.loadTheme()
  }
  
  toggle() {
    const isDark = document.documentElement.getAttribute('data-theme') === 'dark'
    
    if (isDark) {
      this.setLightTheme()
    } else {
      this.setDarkTheme()
    }
  }
  
  setDarkTheme() {
    document.documentElement.setAttribute('data-theme', 'dark')
    this.updateIcon('dark')
    localStorage.setItem('theme', 'dark')
  }
  
  setLightTheme() {
    document.documentElement.removeAttribute('data-theme')
    this.updateIcon('light')
    localStorage.setItem('theme', 'light')
  }
  
  loadTheme() {
    const savedTheme = localStorage.getItem('theme')
    const systemPrefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches
    
    if (savedTheme === 'dark' || (!savedTheme && systemPrefersDark)) {
      this.setDarkTheme()
    } else {
      this.setLightTheme()
    }
  }
  
  updateIcon(theme) {
    if (this.hasIconTarget) {
      this.iconTarget.textContent = theme === 'dark' ? '🌙' : '☀️'
    }
  }
}