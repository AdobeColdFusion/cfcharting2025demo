<form hx-target="#theme_viewport" hx-post="dashboard.cfm" hx-trigger="load">
<label>Select Theme</label>
<select name="charttheme" id="charttheme" class="input select" hx-target="#theme_viewport" hx-post="dashboard.cfm" hx-trigger="change">
    <option value="">(none)</option>
    <option value="blue_dark">Blue Dark</option>
    <option value="blue_light">Blue Light</option>
    <option value="cosmos_dark">Cosmos Dark</option>
    <option value="cosmos_light">Cosmos Light</option>
    <option value="dawn_dark">Dawn Dark</option>
    <option value="dawn_light">Dawn Light</option>
    <option value="feast_dark">Feast Dark</option>
    <option value="feast_light">Feast Light</option>
    <option value="industrial_dark">Industrial Dark</option>
    <option value="industrial_light">Industrial Light</option>
    <option value="retro_dark">Retro Dark</option>
    <option value="retro_light">Retro Light</option>
    <option value="spectrum_dark">Spectrum Dark</option>
    <option value="spectrum_light">Spectrum Light</option>
    <option value="vernal_dark">Vernal Dark</option>
    <option value="vernal_light">Vernal Light</option>
</select>
</form>
<div id="theme_viewport" style="width: 100%; height: calc(100vh - 200px); overflow-x:auto; overflow-y:auto"></div>