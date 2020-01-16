#  TOOLS = glob_wildcards('tools/{tool}').tool
#  TOOLS = [content.name for content in Path("tools/").iterdir() if content.is_dir()]
configfile: "../../Snakeconfig.yml"
MAKETOOLS=f"CC={config['CC']} FC={config['FC']} CFLAGS='{config['CFLAGS']}' FFLAGS='{config['FFLAGS']}' ./maketools"

rule tools:
    params:
        maketools=MAKETOOLS
    shell:
        """
        cd tools/
        {params.maketools} all
        """

rule _tool:
    input:
        "tools/{tool}"
    output:
        "bin/{tool}"
    params:
        maketools=MAKETOOLS
    shell:
        """
        pushd tools/
        {params.maketools} {wildcards.tool}
        popd
        """

rule tools_clean:
    shell:
        """
        cd tools/
        ./maketools clean
        """
