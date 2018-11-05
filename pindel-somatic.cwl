
class: CommandLineTool
label: Pindel-Somatic
cwlVersion: v1.0
baseCommand: ["python", "/opt/pindel.py", "-t", "NORMAL", "-t", "TUMOR"]
requirements:
  - class: DockerRequirement
    dockerPull: opengenomics/pindel:latest

inputs:
  normal:
    type: File
    inputBinding:
      position: 1
      prefix: -b

  tumor:
    type: File
    inputBinding:
      position: 2
      prefix: -b

  normal_insert_size:
    type: int?
    inputBinding:
      position: 1
      prefix: -s

  tumor_insert_size:
    type: int?
    inputBinding:
      position: 2
      prefix: -s

  reference:
    type: File
    inputBinding:
      prefix: -r

  centromere:
    type: File
    inputBinding:
      prefix: -J

  referenceName:
    type: string
    default: HG19
    inputBinding:
      prefix: -R

  window_size:
    type: float
    default: 5.0
    inputBinding:
      prefix: --window_size

  balance_cutoff:
    type: int
    default: 100
    inputBinding:
      prefix: --balance_cutoff

  procs:
    type: int
    default: 2
    inputBinding:
      prefix: --number_of_procs

  report_inversions:
    type: boolean
    default: false
    inputBinding:
      prefix: --report_inversions

  report_duplications:
    type: boolean
    default: false
    inputBinding:
      prefix: --report_duplications

  report_long_insertions:
    type: boolean
    default: false
    inputBinding:
      prefix: --report_long_insertions

  report_breakpoints:
    type: boolean
    default: false
    inputBinding:
      prefix: --report_breakpoints

  report_only_close_mapped_reads:
    type: boolean
    default: false
    inputBinding:
      prefix: -S

  outputRawFile:
    type: string
    default: pindel.raw
    inputBinding:
      prefix: -o1
  
  outputVcfFile:
    type: string
    default: pindel.vcf
    inputBinding:
      prefix: -o2
  
  outputSomaticVcfFile:
    type: string
    default: pindel_somatic.vcf
    inputBinding:
      prefix: -o3
  
  somatic_vaf:
    type: float
    default: 0.08
    inputBinding:
      prefix: --somatic_vaf

  somatic_cov:
    type: int
    default: 20
    inputBinding:
      prefix: --somatic_cov

  somatic_hom:
    type: int
    default: 6
    inputBinding:
      prefix: --somatic_hom

  min_inversion_size:
    type: int
    default: 50
    inputBinding:
      prefix: --min_inversion_size

  min_num_matched_bases:
    type: int
    default: 30
    inputBinding:
      prefix: -d

  max_range_index:
    type: int
    default: 4
    inputBinding:
      prefix: -x

  additional_mismatch:
    type: int
    default: 1
    inputBinding:
      prefix: -a
  
  min_perfect_match_around_BP:
    type: int
    default: 3
    inputBinding:
      prefix: -m
  
  sequencing_error_rate:
    type: float
    default: 0.01
    inputBinding:
      prefix: --sequencing_error_rate

  maximum_allowed_mismatch_rate:
    type: float
    default: 0.02
    inputBinding:
      prefix: --maximum_allowed_mismatch_rate

  minimum_support_for_event:
    type: int
    default: 1
    inputBinding:
      prefix: -M
  
  sensitivity:
    type: float
    default: 0.95
    inputBinding:
      prefix: --sensitivity


outputs:
  vcf:
    type: File
    outputBinding:
      glob: pindel.vcf

  somatic_vcf:
    type: File
    outputBinding:
      glob: pindel_somatic.vcf
      
  rawFile:
    type: File
    outputBinding:
      glob: pindel.raw
