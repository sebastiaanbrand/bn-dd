from pgmpy.models import BayesianNetwork
from pgmpy.factors.discrete import TabularCPD
from pgmpy.readwrite import XMLBIFWriter

def toy_network_1():
    model = BayesianNetwork([('A', 'B'), ('B', 'C')])
    cpd_a = TabularCPD('A', 2, [[0.2], [0.8]])
    cpd_b = TabularCPD('B', 2, [[0.3, 0.25], [0.7, 0.75]],
                        evidence=['A'],
                        evidence_card=[2])
    cpd_c = TabularCPD('C', 2, [[0.1, 0.8], [0.9, 0.2]],
                        evidence=['B'],
                        evidence_card=[2])
    model.add_cpds(cpd_a, cpd_b, cpd_c)
    return model, 'line'

def toy_network_2():
    model = BayesianNetwork([('D', 'G'), ('I', 'G'), ('G', 'L'), ('I', 'S')])
    grade_cpd  = TabularCPD(variable='G', variable_card=3,
                            values=[[0.3, 0.05, 0.9, 0.5],
                                    [0.4, 0.25, 0.08, 0.3],
                                    [0.3, 0.7, 0.02, 0.2]],
                            evidence=['I', 'D'], evidence_card=[2, 2])
    diff_cpd   = TabularCPD(variable='D', variable_card=2, values=[[0.6], [0.4]])
    intel_cpd  = TabularCPD(variable='I', variable_card=2, values=[[0.7], [0.3]])
    letter_cpd = TabularCPD(variable='L', variable_card=2,
                            values=[[0.1, 0.4, 0.99],
                                    [0.9, 0.6, 0.01]],
                            evidence=['G'], evidence_card=[3])
    sat_cpd    = TabularCPD(variable='S', variable_card=2,
                            values=[[0.95, 0.2],
                                    [0.05, 0.8]],
                            evidence=['I'], evidence_card=[2])
    model.add_cpds(grade_cpd, diff_cpd, intel_cpd, letter_cpd, sat_cpd)
    return model, 'student'

if __name__ == '__main__':

        # write toy BN 1
        model, name = toy_network_1()
        writer = XMLBIFWriter(model)
        writer.write_xmlbif(f"models/{name}.xmlbif")
        
        # write toy BN 2
        model, name = toy_network_2()
        writer = XMLBIFWriter(model)
        writer.write_xmlbif(f"models/{name}.xmlbif")
