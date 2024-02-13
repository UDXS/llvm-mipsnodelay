OUTPUT_FORMAT("elf32-tradbigmips", "elf32-tradbigmips","elf32-tradlittlemips")
OUTPUT_ARCH(mips)
SECTIONS
{
  .text           :
  {
    start.o(.text)
    /* _ftext = .; */
  }
  .data           :
  {
    /* _fdata = .; */
  }
}
