#!/usr/bin/zsh

BASE16_SHELL="${HOME}/github/base16-shell/"

export BAT_THEME=base16

[ -n "$PS1" ] && [ -s "${BASE16_SHELL}/profile_helper.sh" ] && source "${BASE16_SHELL}/profile_helper.sh"
        
base16_eighties

export ZSH_THEME="bullet-train"

export BULLETTRAIN_STATUS_EXIT_SHOW=true
export BULLETTRAIN_CONTEXT_HOSTNAME="arch@wsl"
export BULLETTRAIN_DIR_EXTENDED=0 # 0 - current dir, 1 - smart, 2 - full path

# function prompt_tell-if-smawl-repo-topic() {
#     SMAWL_PROJECT_DIR=$(echo "${PWD}" | cut -d'/' -f 5)
#     SMAWL_PRODUCT=$(echo "${SMAWL_PROJECT_DIR}" | cut -d'-' -f 1 | tr '[:lower:]' '[:upper:]')
#     SMAWL_TOPIC=$(echo "${SMAWL_PROJECT_DIR}" | cut -d'-' -f 3- | tr '[:lower:]' '[:upper:]')
#
#     if [[ -z "${SMAWL}" ]]; then
#         SMAWL_SOURCED_STATUS="❕";
#     else
#         if [[ "${SMAWL}" == "${PWD}"* || "${PWD}" == "${SMAWL}"* ]]; then
#             SMAWL_SOURCED_STATUS="🗸"
#         else
#             SMAWL_SOURCED_STATUS="❗";
#         fi
#     fi
#
#     if [[ -z "${SMAWL_TOPIC}" ]]; then
#         SMAWL_TOPIC="Blessed"
#     fi
#
#     if [[ -n "${SMAWL_PRODUCT}" ]]; then
#         printf " %%F{blue}%%K{black}%%F{white} %s :: %s %%F{black}%%K{blue} %%F{green}%s" "${SMAWL_PRODUCT}" "${SMAWL_TOPIC}" "${SMAWL_SOURCED_STATUS}"
#     fi
# }
#
# function prompt_emoji_time() {
#     emoji-clock | tr '\n' ' '
#     printf "%%K{blue}%%F{black}%%F{blue}%%K{black}"
# }
#
# function prompt_task() {
#     TASK=$(task minimal +ACTIVE pro:Work limit:1 2>/dev/null | head -n 4 | tail -n 1 | cut -d' ' -f1,3-)
#     printf " %%F{black}%%K{green} %s %%F{green}%%K{black}" "${TASK}"
# }
#
#export BULLETTRAIN_CUSTOM_MSG='$(tell-if-smawl-repo-topic)'

export BULLETTRAIN_GIT_EXTENDED=false

export BULLETTRAIN_PROMPT_ORDER=(
#    time
#    emoji_time
    status
    context
#    task
    dir
#    tell-if-smawl-repo-topic
#   custom
    git
    cmd_exec_time
)

