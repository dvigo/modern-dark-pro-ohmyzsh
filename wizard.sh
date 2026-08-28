#!/usr/bin/env bash

# ------------------------------------------------------------------------------
# Modern Dark Pro - Multi-Language Interactive Configuration Wizard
# Supports: English (en), Spanish (es), French (fr), German (de), Chinese (zh)
# Auto-detects system language with CLI flag override (--lang=es)
# ------------------------------------------------------------------------------

set -e

# Terminal ANSI Formatting
BOLD="\033[1m"
CYAN="\033[36m"
GREEN="\033[32m"
YELLOW="\033[33m"
MAGENTA="\033[35m"
BLUE="\033[34m"
DIM="\033[2m"
RESET="\033[0m"

ZSHRC="$HOME/.zshrc"
THEME_NAME="modern-dark-pro"
THEME_FILE="${THEME_NAME}.zsh-theme"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
DEST_DIR="${ZSH_CUSTOM}/themes"
DEST_FILE="${DEST_DIR}/${THEME_FILE}"

# Temp file registry for safe EXIT/INT signal cleanup
TMP_FILES=()
cleanup_tmp() {
    for f in "${TMP_FILES[@]}"; do
        [ -f "$f" ] && rm -f "$f" 2>/dev/null
    done
}
trap cleanup_tmp EXIT INT TERM

# Language Auto-Detection
DETECTED_LANG="${LANG:-${LC_ALL:-${LC_MESSAGES:-en}}}"
if [[ "$DETECTED_LANG" == "C"* || "$DETECTED_LANG" == "POSIX"* || -z "$DETECTED_LANG" ]]; then
    if command -v defaults &>/dev/null; then
        mac_lang=$(defaults read -g AppleLanguages 2>/dev/null | grep -oE '"[a-z]{2}' | head -n 1 | tr -d '"')
        [[ -n "$mac_lang" ]] && DETECTED_LANG="$mac_lang"
    fi
fi
DETECTED_LANG="${DETECTED_LANG:0:2}"

LANG_CODE="${DETECTED_LANG}"
for arg in "$@"; do
    case "$arg" in
        --lang=*) LANG_CODE="${arg#*=}" ;;
    esac
done

case "$LANG_CODE" in
    es)
        T_TITLE="🎨 Modern Dark Pro Theme - Asistente de Configuración"
        T_SUBTITLE="¡Bienvenido! Este asistente te guiará para personalizar tu terminal."
        T_STEP1_TITLE="Variante de Color"
        T_STEP1_DESC="Elige tu paleta de colores base:"
        T_STEP1_OPT1="Night (Tonos pastel suaves en fondo oscuro)"
        T_STEP1_OPT2="Monokai (Colores clásicos Monokai de alto contraste)"
        T_STEP2_TITLE="Estructura del Prompt"
        T_STEP2_DESC="Elige la disposición de la línea del prompt:"
        T_STEP2_OPT1="Dos Líneas (Línea 1: Estado + reloj, Línea 2: Entrada ❯)"
        T_STEP2_OPT2="Una Línea (Estado + entrada ❯ en una línea)"
        T_STEP2_OPT3="Clásico (Con líneas guía de conexión ┌─ y └─)"
        T_STEP3_TITLE="Iconos de Desarrollador (Nerd Fonts)"
        T_STEP3_DESC="¿Deseas activar iconos de desarrollador (requiere Nerd Font)?"
        T_STEP3_OPT1="Sí (Activar iconos:  carpeta,  git,  reloj,  candado)"
        T_STEP3_OPT2="No (Usar Unicode básico / texto limpio)"
        T_STEP4_TITLE="Estadísticas de Líneas Git (+/-)"
        T_STEP4_DESC="¿Mostrar recuento exacto de líneas añadidas/eliminadas en Git (+12/-5)?"
        T_STEP4_OPT1="Desactivado (Mostrar símbolo sucio estándar ✗)"
        T_STEP4_OPT2="Activado (Mostrar recuento de líneas +12/-5)"
        T_STEP5_TITLE="Posición del Reloj"
        T_STEP5_DESC="¿Dónde deseas ubicar el reloj de sistema (HH:MM:SS)?"
        T_STEP5_OPT1="Línea del Prompt Derecha (RPROMPT) (Alineado al margen derecho)"
        T_STEP5_OPT2="Línea Superior Derecha (Alineado con espacios)"
        T_STEP5_OPT3="Deshabilitado (Ocultar reloj)"
        T_STEP6_TITLE="Estilo de Ruta de Directorio"
        T_STEP6_DESC="¿Cómo deseas formatear la ruta del directorio activo?"
        T_STEP6_OPT1="Limitado a N niveles (.../proyectos/repo)"
        T_STEP6_OPT2="Contraído (~/d/p/repo)"
        T_STEP6_OPT3="Ruta Completa (~/dev/proyectos/repo)"
        T_STEP7_TITLE="Hipervínculos Clicables (OSC 8)"
        T_STEP7_DESC="¿Activar enlaces clicables (Cmd/Ctrl+Clic para abrir carpeta o rama Git)?"
        T_STEP7_OPT1="Activado"
        T_STEP7_OPT2="Desactivado"
        T_PROMPT_SELECT="Selecciona una opción"
        T_DEFAULT="Por defecto"
        T_SUMMARY="Resumen de Configuración:"
        T_APPLY_PROMPT="¿Guardar esta configuración en ~/.zshrc? [Y/n]"
        T_CANCELLED="Configuración cancelada."
        T_SAVED="¡Configuración guardada correctamente en ~/.zshrc!"
        T_RELOAD_PROMPT="¿Deseas recargar la sesión de tu terminal ahora (exec zsh)? [Y/n]"
        T_RELOAD_SOURCE_PROMPT="¿Deseas aplicar la configuración ahora (source ~/.zshrc)? [Y/n]"
        T_RELOADING="Recargando sesión del terminal..."
        T_APPLYING="Aplicando configuración..."
        T_MANUAL_NOTE="Para aplicar los cambios manualmente en esta ventana, ejecuta:"
        ;;
    fr)
        T_TITLE="🎨 Modern Dark Pro Theme - Assistant de Configuration"
        T_SUBTITLE="Bienvenue ! Cet assistant vous guidera pour configurer votre terminal."
        T_STEP1_TITLE="Variante de Couleur"
        T_STEP1_DESC="Choisissez votre palette de couleurs de base :"
        T_STEP1_OPT1="Night (Tons pastel doux sur fond sombre)"
        T_STEP1_OPT2="Monokai (Couleurs Monokai classiques à fort contraste)"
        T_STEP2_TITLE="Disposition de l'Invite"
        T_STEP2_DESC="Choisissez la structure de la ligne d'invite :"
        T_STEP2_OPT1="Deux Lignes (Ligne 1 : État + horloge, Ligne 2 : Invite ❯)"
        T_STEP2_OPT2="Une Ligne (État + invite ❯ sur une seule ligne)"
        T_STEP2_OPT3="Classique (Avec connecteurs ┌─ et └─)"
        T_STEP3_TITLE="Icônes de Développeur (Nerd Fonts)"
        T_STEP3_DESC="Activer les icônes développeur (nécessite une police Nerd Font) ?"
        T_STEP3_OPT1="Oui (Activer les icônes :  dossier,  git,  horloge,  cadenas)"
        T_STEP3_OPT2="Non (Utiliser le texte Unicode propre)"
        T_STEP4_TITLE="Statistiques de Lignes Git (+/-)"
        T_STEP4_DESC="Afficher le nombre exact de lignes ajoutées/supprimées dans Git (+12/-5) ?"
        T_STEP4_OPT1="Désactivé (Afficher le symbole standard ✗)"
        T_STEP4_OPT2="Activé (Afficher le compte de lignes +12/-5)"
        T_STEP5_TITLE="Position de l'Horloge"
        T_STEP5_DESC="Où souhaitez-vous placer l'horloge système (HH:MM:SS) ?"
        T_STEP5_OPT1="Ligne d'Invite Droite (RPROMPT) (Alignée à la marge droite)"
        T_STEP5_OPT2="Ligne Supérieure Droite (Alignée avec des espaces)"
        T_STEP5_OPT3="Désactivée (Masquer l'horloge)"
        T_STEP6_TITLE="Style de Chemin de Dossier"
        T_STEP6_DESC="Comment souhaitez-vous afficher le chemin du dossier actif ?"
        T_STEP6_OPT1="Limité à N niveaux (.../projets/repo)"
        T_STEP6_OPT2="Raccourci (~/d/p/repo)"
        T_STEP6_OPT3="Chemin Complet (~/dev/projets/repo)"
        T_STEP7_TITLE="Liens Cliquables (OSC 8)"
        T_STEP7_DESC="Activer les liens cliquables (Cmd/Ctrl+Clic pour ouvrir le dossier ou la branche Git) ?"
        T_STEP7_OPT1="Activé"
        T_STEP7_OPT2="Désactivé"
        T_PROMPT_SELECT="Sélectionnez une option"
        T_DEFAULT="Par défaut"
        T_SUMMARY="Résumé de la Configuration :"
        T_APPLY_PROMPT="Appliquer ces paramètres dans ~/.zshrc ? [Y/n]"
        T_CANCELLED="Configuration annulée."
        T_SAVED="Configuration enregistrée avec succès dans ~/.zshrc !"
        T_RELOAD_PROMPT="Voulez-vous recharger votre session de terminal maintenant (exec zsh) ? [Y/n]"
        T_RELOAD_SOURCE_PROMPT="Voulez-vous appliquer la configuration maintenant (source ~/.zshrc) ? [Y/n]"
        T_RELOADING="Rechargement de la session..."
        T_APPLYING="Application de la configuration..."
        T_MANUAL_NOTE="Pour appliquer les modifications manuellement, exécutez :"
        ;;
    de)
        T_TITLE="🎨 Modern Dark Pro Theme - Konfigurationsassistent"
        T_SUBTITLE="Willkommen! Dieser Assistent hilft Ihnen beim Konfigurieren Ihres Terminal-Prompts."
        T_STEP1_TITLE="Farbvariante"
        T_STEP1_DESC="Wählen Sie Ihr Farbschema:"
        T_STEP1_OPT1="Night (Sanfte Pastelltöne auf dunklem Hintergrund)"
        T_STEP1_OPT2="Monokai (Klassische kontrastreiche Monokai-Farben)"
        T_STEP2_TITLE="Prompt-Layout"
        T_STEP2_DESC="Wählen Sie die Struktur der Prompt-Zeile:"
        T_STEP2_OPT1="Zweizeilig (Zeile 1: Status + Uhr, Zeile 2: Eingabe ❯)"
        T_STEP2_OPT2="Einzeilig (Status + Eingabe ❯ auf einer Zeile)"
        T_STEP2_OPT3="Klassisch (Mit Verbindungslinien ┌─ und └─)"
        T_STEP3_TITLE="Entwickler-Icons (Nerd Fonts)"
        T_STEP3_DESC="Entwickler-Icons aktivieren (erfordert Nerd Font Schriftart)?"
        T_STEP3_OPT1="Ja (Icons aktivieren:  Ordner,  Git,  Uhr,  Schloss)"
        T_STEP3_OPT2="Nein (Standard-Unicode verwenden)"
        T_STEP4_TITLE="Git-Zeilenstatistik (+/-)"
        T_STEP4_DESC="Genaue Anzahl hinzugefügter/gelöschter Git-Zeilen anzeigen (+12/-5)?"
        T_STEP4_OPT1="Deaktiviert (Standard-Symbol ✗ anzeigen)"
        T_STEP4_OPT2="Aktiviert (Zeilenzahl +12/-5 anzeigen)"
        T_STEP5_TITLE="Uhrzeit-Position"
        T_STEP5_DESC="Wo soll die System-Uhrzeit (HH:MM:SS) platziert werden?"
        T_STEP5_OPT1="Rechte Prompt-Zeile (RPROMPT) (Am rechten Rand ausgerichtet)"
        T_STEP5_OPT2="Obere Zeile Rechts (Mit Leerzeichen ausgerichtet)"
        T_STEP5_OPT3="Deaktiviert (Uhr ausblenden)"
        T_STEP6_TITLE="Ordnerpfad-Stil"
        T_STEP6_DESC="Wie soll der aktive Pfad formatiert werden?"
        T_STEP6_OPT1="Begrenzt auf N Ebenen (.../projekte/repo)"
        T_STEP6_OPT2="Verkürzt (~/d/p/repo)"
        T_STEP6_OPT3="Vollständiger Pfad (~/dev/projekte/repo)"
        T_STEP7_TITLE="Klickbare Links (OSC 8)"
        T_STEP7_DESC="Klickbare Terminal-Links aktivieren (Cmd/Ctrl+Klick zum Öffnen von Ordner oder Git-Branch)?"
        T_STEP7_OPT1="Aktiviert"
        T_STEP7_OPT2="Deaktiviert"
        T_PROMPT_SELECT="Wählen Sie eine Option"
        T_DEFAULT="Standard"
        T_SUMMARY="Konfigurationszusammenfassung:"
        T_APPLY_PROMPT="Einstellungen in ~/.zshrc übernehmen? [Y/n]"
        T_CANCELLED="Konfiguration abgebrochen."
        T_SAVED="Konfiguration erfolgreich in ~/.zshrc gespeichert!"
        T_RELOAD_PROMPT="Möchten Sie Ihre Terminal-Sitzung jetzt neu laden (exec zsh)? [Y/n]"
        T_RELOAD_SOURCE_PROMPT="Möchten Sie die Konfiguration jetzt anwenden (source ~/.zshrc)? [Y/n]"
        T_RELOADING="Terminal-Sitzung wird neu geladen..."
        T_APPLYING="Konfiguration wird angewendet..."
        T_MANUAL_NOTE="Um Änderungen manuell zu übernehmen, führen Sie aus:"
        ;;
    zh)
        T_TITLE="🎨 Modern Dark Pro 主题 - 配置向导"
        T_SUBTITLE="欢迎！此向导将帮助您配置终端 Prompt 样式。"
        T_STEP1_TITLE="颜色主题变体"
        T_STEP1_DESC="选择您的基础配色方案："
        T_STEP1_OPT1="Night (深色背景上的柔和粉彩配色)"
        T_STEP1_OPT2="Monokai (高对比度经典 Monokai 配色)"
        T_STEP2_TITLE="Prompt 布局"
        T_STEP2_DESC="选择 Prompt 结构风格："
        T_STEP2_OPT1="双行 (第1行：状态+时钟，第2行：输入符 ❯)"
        T_STEP2_OPT2="单行 (状态+输入符 ❯ 在同一行)"
        T_STEP2_OPT3="经典 (使用连接线 ┌─ 和 └─ 的格式)"
        T_STEP3_TITLE="开发者图标 (Nerd Fonts)"
        T_STEP3_DESC="是否启用开发者图标（需要安装 Nerd Fonts 字体）？"
        T_STEP3_OPT1="是 (启用图标： 文件夹,  Git,  时钟,  锁)"
        T_STEP3_OPT2="否 (使用极简标准 Unicode 文本)"
        T_STEP4_TITLE="Git 代码行增删统计 (+/-)"
        T_STEP4_DESC="是否显示 Git 代码行修改的精确增删统计 (+12/-5)？"
        T_STEP4_OPT1="已禁用 (显示标准修改标记 ✗)"
        T_STEP4_OPT2="已启用 (显示增删统计 +12/-5)"
        T_STEP5_TITLE="时钟显示位置"
        T_STEP5_DESC="您希望时钟 (HH:MM:SS) 显示在哪里？"
        T_STEP5_OPT1="右侧 Prompt 行 (RPROMPT) (靠最右侧边界对齐)"
        T_STEP5_OPT2="顶行靠右对齐 (使用空格对齐)"
        T_STEP5_OPT3="禁用时钟 (不显示)"
        T_STEP6_TITLE="目录路径显示风格"
        T_STEP6_DESC="您希望如何格式化当前工作目录？"
        T_STEP6_OPT1="限制 N 层深度 (.../projects/repo)"
        T_STEP6_OPT2="精简路径 (~/d/p/repo)"
        T_STEP6_OPT3="完整路径 (~/dev/projects/repo)"
        T_STEP7_TITLE="可点击超链接 (OSC 8)"
        T_STEP7_DESC="是否启用终端可点击链接 (Cmd/Ctrl+点击打开文件夹或 Git 分支)？"
        T_STEP7_OPT1="已启用"
        T_STEP7_OPT2="已禁用"
        T_PROMPT_SELECT="请选择选项"
        T_DEFAULT="默认"
        T_SUMMARY="配置摘要："
        T_APPLY_PROMPT="是否将这些设置应用到 ~/.zshrc？ [Y/n]"
        T_CANCELLED="配置已取消。"
        T_SAVED="配置已成功保存到 ~/.zshrc！"
        T_RELOAD_PROMPT="是否立即重新加载终端会话 (exec zsh)？ [Y/n]"
        T_RELOAD_SOURCE_PROMPT="是否立即应用配置 (source ~/.zshrc)？ [Y/n]"
        T_RELOADING="正在重新加载终端会话..."
        T_APPLYING="正在应用配置..."
        T_MANUAL_NOTE="如需手动应用更改，请运行："
        ;;
    *) # English (default fallback)
        T_TITLE="🎨 Modern Dark Pro Theme - Configuration Wizard"
        T_SUBTITLE="Welcome! This wizard will help you configure your terminal prompt style."
        T_STEP1_TITLE="Color Variant"
        T_STEP1_DESC="Choose your base color scheme:"
        T_STEP1_OPT1="Night (Soft pastel tones on dark background)"
        T_STEP1_OPT2="Monokai (Vibrant classic Monokai colors)"
        T_STEP2_TITLE="Prompt Layout"
        T_STEP2_DESC="Choose your prompt line structure:"
        T_STEP2_OPT1="Two-Line (Line 1: Status + clock, Line 2: Input ❯)"
        T_STEP2_OPT2="Single-Line (Status + input ❯ on single line)"
        T_STEP2_OPT3="Classic (Status with guide connectors ┌─ and └─)"
        T_STEP3_TITLE="Developer Icons (Nerd Fonts)"
        T_STEP3_DESC="Enable developer icons (requires Nerd Font installed)?"
        T_STEP3_OPT1="Yes (Enable icons:  folder,  git,  clock,  lock)"
        T_STEP3_OPT2="No (Use standard clean Unicode/text)"
        T_STEP4_TITLE="Git Line Diff Stats (+/-)"
        T_STEP4_DESC="Display exact added/deleted line counts in Git (+12/-5)?"
        T_STEP4_OPT1="Disabled (Show standard dirty symbol ✗)"
        T_STEP4_OPT2="Enabled (Show line diff stats +12/-5)"
        T_STEP5_TITLE="System Clock Position"
        T_STEP5_DESC="Where would you like the clock (HH:MM:SS) to be placed?"
        T_STEP5_OPT1="Right Prompt Line (RPROMPT) (Natively aligned to far right margin)"
        T_STEP5_OPT2="Top Line Right (Space-aligned on top line)"
        T_STEP5_OPT3="Disabled (Hide clock completely)"
        T_STEP6_TITLE="Directory Path Style"
        T_STEP6_DESC="How would you like the active working directory to be displayed?"
        T_STEP6_OPT1="Limit to N levels (.../projects/repo)"
        T_STEP6_OPT2="Shrink parent folders (~/d/p/repo)"
        T_STEP6_OPT3="Full directory path (~/dev/projects/repo)"
        T_STEP7_TITLE="Clickable Hyperlinks (OSC 8)"
        T_STEP7_DESC="Enable clickable terminal links (Cmd/Ctrl+Click to open folder or Git branch)?"
        T_STEP7_OPT1="Enabled"
        T_STEP7_OPT2="Disabled"
        T_PROMPT_SELECT="Select option"
        T_DEFAULT="Default"
        T_SUMMARY="Configuration Summary:"
        T_APPLY_PROMPT="Apply these settings to ~/.zshrc? [Y/n]"
        T_CANCELLED="Configuration cancelled."
        T_SAVED="Configuration successfully saved to ~/.zshrc!"
        T_RELOAD_PROMPT="Would you like to reload your terminal session now (exec zsh)? [Y/n]"
        T_RELOAD_SOURCE_PROMPT="Would you like to apply the configuration now (source ~/.zshrc)? [Y/n]"
        T_RELOADING="Reloading terminal session..."
        T_APPLYING="Applying configuration..."
        T_MANUAL_NOTE="To activate your changes manually in this terminal window, run:"
        ;;
esac

# Ensure theme file is symlinked to Oh My Zsh custom themes
if [ -d "$ZSH_CUSTOM" ]; then
    mkdir -p "$DEST_DIR"
    if [ ! -e "$DEST_FILE" ]; then
        echo -e "${DIM}🔗 Creating theme symlink at $DEST_FILE...${RESET}"
        ln -sf "${SCRIPT_DIR}/${THEME_FILE}" "$DEST_FILE"
    fi
fi

# Function to display step header with clear screen
step_header() {
    local current="$1"
    local total="$2"
    local title="$3"
    clear 2>/dev/null || true
    echo -e "${BOLD}${CYAN}"
    echo "----------------------------------------------------------------------"
    echo "  ${T_TITLE}"
    echo "----------------------------------------------------------------------"
    echo -e "${RESET}"
    echo "${T_SUBTITLE}"
    echo -e "${DIM}(Language / Idioma / Langue / Sprache / 语言: ${LANG_CODE})${RESET}"
    echo ""
    echo -e "${BOLD}${MAGENTA}[${current}/${total}] ${title}${RESET}"
}

# --- Step 1: Color Variant ---
step_header 1 7 "${T_STEP1_TITLE}"
echo "${T_STEP1_DESC}"
echo -e "  ${BOLD}1)${RESET} ${CYAN}${T_STEP1_OPT1}${RESET} ${GREEN}[${T_DEFAULT}]${RESET}"
echo -e "  ${BOLD}2)${RESET} ${YELLOW}${T_STEP1_OPT2}${RESET}"
read -p "${T_PROMPT_SELECT} [1-2, default: 1]: " choice_variant
case "$choice_variant" in
    2) VARIANT="monokai" ;;
    *) VARIANT="night" ;;
esac

# --- Step 2: Prompt Layout ---
step_header 2 7 "${T_STEP2_TITLE}"
echo "${T_STEP2_DESC}"
echo -e "  ${BOLD}1)${RESET} ${CYAN}${T_STEP2_OPT1}${RESET} ${GREEN}[${T_DEFAULT}]${RESET}"
echo -e "  ${BOLD}2)${RESET} ${BLUE}${T_STEP2_OPT2}${RESET}"
echo -e "  ${BOLD}3)${RESET} ${YELLOW}${T_STEP2_OPT3}${RESET}"
read -p "${T_PROMPT_SELECT} [1-3, default: 1]: " choice_layout
case "$choice_layout" in
    2) PROMPT_LAYOUT="single" ;;
    3) PROMPT_LAYOUT="classic" ;;
    *) PROMPT_LAYOUT="two-line" ;;
esac

# --- Step 3: Developer Icons (Nerd Fonts) ---
step_header 3 7 "${T_STEP3_TITLE}"
echo "${T_STEP3_DESC}"
echo -e "  ${BOLD}1)${RESET} ${GREEN}${T_STEP3_OPT1}${RESET}"
echo -e "  ${BOLD}2)${RESET} ${DIM}${T_STEP3_OPT2}${RESET} ${GREEN}[${T_DEFAULT}]${RESET}"
read -p "${T_PROMPT_SELECT} [1-2, default: 2]: " choice_nerd
case "$choice_nerd" in
    1) NERD_FONTS="true" ;;
    *) NERD_FONTS="false" ;;
esac

# --- Step 4: Git Line Diff Stats ---
step_header 4 7 "${T_STEP4_TITLE}"
echo "${T_STEP4_DESC}"
echo -e "  ${BOLD}1)${RESET} ${DIM}${T_STEP4_OPT1}${RESET} ${GREEN}[${T_DEFAULT}]${RESET}"
echo -e "  ${BOLD}2)${RESET} ${GREEN}${T_STEP4_OPT2}${RESET}"
read -p "${T_PROMPT_SELECT} [1-2, default: 1]: " choice_diff
case "$choice_diff" in
    2) DIFF_STATS="true" ;;
    *) DIFF_STATS="false" ;;
esac

# --- Step 5: Clock Position & Display ---
step_header 5 7 "${T_STEP5_TITLE}"
echo "${T_STEP5_DESC}"
echo -e "  ${BOLD}1)${RESET} ${CYAN}${T_STEP5_OPT1}${RESET} ${GREEN}[${T_DEFAULT}]${RESET}"
echo -e "  ${BOLD}2)${RESET} ${BLUE}${T_STEP5_OPT2}${RESET}"
echo -e "  ${BOLD}3)${RESET} ${DIM}${T_STEP5_OPT3}${RESET}"
read -p "${T_PROMPT_SELECT} [1-3, default: 1]: " choice_clock
case "$choice_clock" in
    2) SHOW_CLOCK="true"; CLOCK_POS="top" ;;
    3) SHOW_CLOCK="false"; CLOCK_POS="top" ;;
    *) SHOW_CLOCK="true"; CLOCK_POS="rprompt" ;;
esac

# --- Step 6: Directory Path Style ---
step_header 6 7 "${T_STEP6_TITLE}"
echo "${T_STEP6_DESC}"
echo -e "  ${BOLD}1)${RESET} ${CYAN}${T_STEP6_OPT1}${RESET} ${GREEN}[${T_DEFAULT}]${RESET}"
echo -e "  ${BOLD}2)${RESET} ${BLUE}${T_STEP6_OPT2}${RESET}"
echo -e "  ${BOLD}3)${RESET} ${YELLOW}${T_STEP6_OPT3}${RESET}"
read -p "${T_PROMPT_SELECT} [1-3, default: 1]: " choice_path
case "$choice_path" in
    2) PATH_STYLE="shrink" ;;
    3) PATH_STYLE="full" ;;
    *) PATH_STYLE="limit" ;;
esac

# --- Step 7: Clickable Hyperlinks (OSC 8) ---
step_header 7 7 "${T_STEP7_TITLE}"
echo "${T_STEP7_DESC}"
echo -e "  ${BOLD}1)${RESET} ${GREEN}${T_STEP7_OPT1}${RESET} ${GREEN}[${T_DEFAULT}]${RESET}"
echo -e "  ${BOLD}2)${RESET} ${DIM}${T_STEP7_OPT2}${RESET}"
read -p "${T_PROMPT_SELECT} [1-2, default: 1]: " choice_links
case "$choice_links" in
    2) CLICKABLE="false" ;;
    *) CLICKABLE="true" ;;
esac

# --- Summary of Choices ---
clear 2>/dev/null || true
echo -e "${BOLD}${CYAN}"
echo "----------------------------------------------------------------------"
echo "  ${T_TITLE}"
echo "----------------------------------------------------------------------"
echo -e "${RESET}"
echo -e "${BOLD}📋 ${T_SUMMARY}${RESET}"
echo -e "  • ZSH_THEME:                          ${GREEN}${THEME_NAME}${RESET}"
echo -e "  • MODERN_DARK_PRO_VARIANT:            ${YELLOW}${VARIANT}${RESET}"
echo -e "  • MODERN_DARK_PRO_PROMPT_LAYOUT:      ${YELLOW}${PROMPT_LAYOUT}${RESET}"
echo -e "  • MODERN_DARK_PRO_NERD_FONTS:         ${YELLOW}${NERD_FONTS}${RESET}"
echo -e "  • MODERN_DARK_PRO_SHOW_GIT_DIFF_STATS:${YELLOW}${DIFF_STATS}${RESET}"
echo -e "  • MODERN_DARK_PRO_SHOW_CLOCK:         ${YELLOW}${SHOW_CLOCK}${RESET}"
echo -e "  • MODERN_DARK_PRO_CLOCK_POSITION:     ${YELLOW}${CLOCK_POS}${RESET}"
echo -e "  • MODERN_DARK_PRO_PATH_STYLE:         ${YELLOW}${PATH_STYLE}${RESET}"
echo -e "  • MODERN_DARK_PRO_CLICKABLE_PATH:     ${YELLOW}${CLICKABLE}${RESET}"
echo -e "  • MODERN_DARK_PRO_CLICKABLE_GIT:      ${YELLOW}${CLICKABLE}${RESET}"
echo -e "${BOLD}${CYAN}----------------------------------------------------------------------${RESET}"

read -p "${T_APPLY_PROMPT} " choice_confirm
if [[ "$choice_confirm" =~ ^[Nn]$ ]]; then
    echo "${T_CANCELLED}"
    exit 0
fi

# Ensure ~/.zshrc exists
touch "$ZSHRC"

# Backup ~/.zshrc
cp "$ZSHRC" "${ZSHRC}.bak.$(date +%Y%m%d%H%M%S)"
echo -e "${DIM}💾 Backup created at ${ZSHRC}.bak...${RESET}"

# Write config block into a temp file
cfg_file=$(mktemp)
TMP_FILES+=("$cfg_file")
cat << CONFIG_EOF > "$cfg_file"
# Modern Dark Pro Theme Config
ZSH_THEME="${THEME_NAME}"
export MODERN_DARK_PRO_VARIANT="${VARIANT}"
export MODERN_DARK_PRO_PROMPT_LAYOUT="${PROMPT_LAYOUT}"
export MODERN_DARK_PRO_NERD_FONTS=${NERD_FONTS}
export MODERN_DARK_PRO_SHOW_GIT_DIFF_STATS=${DIFF_STATS}
export MODERN_DARK_PRO_SHOW_CLOCK=${SHOW_CLOCK}
export MODERN_DARK_PRO_CLOCK_POSITION="${CLOCK_POS}"
export MODERN_DARK_PRO_PATH_STYLE="${PATH_STYLE}"
export MODERN_DARK_PRO_CLICKABLE_PATH=${CLICKABLE}
export MODERN_DARK_PRO_CLICKABLE_GIT=${CLICKABLE}

CONFIG_EOF

# Filter existing theme lines from ~/.zshrc into temp file
cleaned_zshrc=$(mktemp)
TMP_FILES+=("$cleaned_zshrc")
grep -v "^ZSH_THEME=" "$ZSHRC" | grep -v "^export MODERN_DARK_PRO_" | grep -v "^# Modern Dark Pro" "$ZSHRC" > "$cleaned_zshrc" || true

tmp_file=$(mktemp)
TMP_FILES+=("$tmp_file")

# Insert cfg_file before "source $ZSH/oh-my-zsh.sh"
if grep -q "source \$ZSH/oh-my-zsh.sh" "$cleaned_zshrc"; then
    while IFS= read -r line || [[ -n "$line" ]]; do
        if [[ "$line" =~ source\ \$ZSH/oh-my-zsh\.sh ]]; then
            cat "$cfg_file" >> "$tmp_file"
        fi
        echo "$line" >> "$tmp_file"
    done < "$cleaned_zshrc"
else
    cat "$cfg_file" >> "$tmp_file"
    cat "$cleaned_zshrc" >> "$tmp_file"
fi

rm -f "$cfg_file" "$cleaned_zshrc"
mv "$tmp_file" "$ZSHRC"

echo ""
echo -e "${BOLD}${GREEN}✅ ${T_SAVED}${RESET}"
echo ""

# Ask to apply changes immediately
if [[ "${ZSH_EVAL_CONTEXT:-}" == *"toplevel"* ]] || [[ "${BASH_SOURCE[0]}" != "$0" ]]; then
    # Script was sourced directly
    read -p "🔄 ${T_RELOAD_SOURCE_PROMPT} " choice_reload
    if [[ "$choice_reload" =~ ^[Yy]$ ]] || [[ -z "$choice_reload" ]]; then
        echo -e "${GREEN}${T_APPLYING}${RESET}"
        source "$ZSHRC"
    fi
else
    # Script was executed as a subprocess
    read -p "🔄 ${T_RELOAD_PROMPT} " choice_reload
    if [[ "$choice_reload" =~ ^[Yy]$ ]] || [[ -z "$choice_reload" ]]; then
        echo -e "${DIM}${T_RELOADING}${RESET}"
        exec zsh
    else
        echo -e "${T_MANUAL_NOTE}"
        echo -e "  ${BOLD}${CYAN}source ~/.zshrc${RESET}"
        echo ""
    fi
fi
