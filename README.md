# RTOS_SKELETON
## Esqueleto para ambiente de desenvolvimento do VS Code e para a placa (alternativa) de desenvolvimento blue pill.

**Para compilar o arquivo-fonte FreeRTOS_openocd.c com gcc é preciso adicionar os argumentos "-Wl,--undefined=uxTopUsedPriority" em LDFLAGS, sem aspas, se estiver usando "-Wl,--gc-sections".**

Caso queira usar a função printf otimizada é preciso adicionar o arquivo-fonte **tiny_printf.c** para compilação, e se quiser usar o printf com a saída USB da placa blue pill, descomente as linhas **40**, **42** e **86** do arquivo-fonte **syscalls.c** e o adicione para compilação também.
