import pandas as pd
import numpy as np
import networkx as nx
import copy
import pandas as pd
import numpy as np
import networkx as nx
import numbers
import math
from unittest.mock import patch





class Graph:
    """
    Common class for graphs, evidences and EDA.
    """

    def __init__(self):
        """
        Create NetworkX graph object at initialization
        """
        self.g = nx.DiGraph()

    def set_data(self, dataframe):
        """Set Data using Pandas DataFrame. Parameters(mean,cov) are set automatically from DataFrame.

        Parameters
        ----------
        dataframe: Pandas Dataframe containing columns with all nodes.

        Returns
        -------
        None

        """
        if not isinstance(dataframe, pd.DataFrame):
            raise TypeError("Argument invalid. Please provide Pandas DataFrame")
        if len(dataframe.columns) <= 1:
            raise ValueError(f"Dataframe contains only {dataframe.columns}")
        if not set(list((self.g.nodes))).issubset(list(dataframe.columns)):
            raise ValueError(
                f"DataFrame does not contain {np.setdiff1d(list(self.g.nodes), list(dataframe.columns))}"
            )
        dataframe = dataframe[list(self.g.nodes)]
        self.data = dataframe.reindex(sorted(dataframe.columns), axis=1)
        self.nodes = list((self.data.columns))
        self.mean = np.array(self.get_mean())
        self.cov = np.array(self.get_covariance())
        self.precision_matrix = np.linalg.inv(self.cov)
        self.hvector = self.precision_matrix.dot(self.mean)
        self.evidences = dict.fromkeys(self.nodes)

    def set_parameters(self, mean, cov):  # TODO self.data.mean giving errors
        """Set Mean and covariance manually without pandas dataframe.

        NOT IMPLEMENTED YET.
        Parameters
        ----------
        mean: Mean Vector
        cov: Covariance Matrix

        Returns
        -------
        None

        """
        raise ValueError("Not implemented yet.")
        # self.mean = np.array(mean)
        # self.cov = np.array(cov)
        # self.nodes = list(self.g.nodes)
        # if cov.shape[0] != cov.shape[1]:
        #     raise ValueError("Covariance Matrix is not a square.")
        # if not self.mean.shape[0] == self.cov.shape[0]:
        #     raise ValueError(f"Mean and covariance matrix does not have matching dimentions {mean.shape},{cov.shape}")
        # if len(self.g.nodes) != self.mean.shape[0]:
        #     raise ValueError("Length of mean vector!= length of nodes")
        # self.evidences = dict.fromkeys(self.nodes)

    def get_covariance(self):
        """Returns  Covariance matrix

        Returns
        -------
        ndarray: nxn array of Covariance matrix

        """
        return self.data.cov()

    def get_precision_matrix(self):
        """Returns Inverse Covariance matrix (or Precision or Information Matrix)

        Returns
        -------
        ndarray: nxn array of precision matrix

        """
        return self.precision_matrix

    def get_mean(self):
        """Get mean of data

        Returns
        -------
        list of means

        """
        return self.data.mean()

    def set_edge(self, u, v):
        """Set single edge from u to v
        Parameters
        ----------
        u: From node
        v: To node

        Returns
        -------
        None

        """
        if u == v:
            raise ValueError("Self Loops not allowed.")
        self.g.add_edge(u, v)

    def set_edges_from(self, edges):
        """Set edges of network using list of edge tuples

        Parameters
        ----------
        edges: list of tuples of edges

        Returns
        -------
        None

        """
        for edge in edges:
            if edge[0] == edge[1]:
                raise ValueError("Self loops not allowed")
            self.g.add_edge(edge[0], edge[1])

    def get_parents(self, node):
        """

        Parameters
        ----------
        node: Node for which parents need to be returned

        Returns
        -------
        List of parent nodes

        """
        return list(self.g.pred[node])

    def get_children(self, node):
        """Get children of nodes

        Parameters
        ----------
        node: Node

        Returns
        -------
        list: list of children if any

        """

        return list(self.g.succ[node])

    def get_siblings(self, node):
        """Get sibling of node

        Parameters
        ----------
        node: Node

        Returns
        -------
        list of siblings if any

        """
        successors = list(self.g.succ[node])
        siblings = []
        for s in successors:
            siblings.extend(list(self.g.pred[s]))
        return list(set(siblings))

    def get_neighbors(self,node):
        """Get neighbors of node

        Parameters
        ----------
        node: Node

        Returns
        -------
        list of neighbors if any

        """
        return list(nx.all_neighbors(self.g,node))

    def get_nodes(self):
        """ Get list of nodes in network

        Returns
        -------
        list: List of nodes

        """
        return list(self.g.nodes)

    def get_edges(self):
        """Get list of edges in network

        Returns
        -------
        list: List of edges

        """

        return list(self.g.edges)

    def has_parents(self,node):
        """Check if node has parents.

        Parameters
        ----------
        node: Check if this node has parents

        Returns
        -------
        bool: True if has parents, False otherwise

        """
        parents = self.get_parents(node)
        return True if len(parents)!=0 else False

    def has_children(self,node):
        """Check if node has children.

               Parameters
               ----------
               node: Check if this node has children

               Returns
               -------
               bool: True if has children, False otherwise

               """
        parents = self.get_children(node)
        return True if len(parents)!=0 else False

    def remove_nodes(self, nodes):
        """Remove selected nodes from network

        Parameters
        ----------
        nodes: list of nodes

        Returns
        -------
        None

        """
        self.g.remove_nodes_from(nodes)


    def set_evidences(self, evidence_dict):
        """Set evidence using dictionary key,value pairs

        Parameters
        ----------
        evidence_dict: dictionary of evidence

        Returns
        -------
        None

        """
        if not isinstance(evidence_dict, dict):
            raise ValueError("Please provide dictionary")

        for key, val in evidence_dict.items():
            if key not in self.nodes:
                raise ValueError(f"'{key}'' node is not available in network")
            if not isinstance(val, numbers.Number):
                raise ValueError(
                    f"Node '{key}'s given evidence is not a number. It's ({val})'"
                )
            self.evidences[key] = val

    def get_evidences(self):
        """Get evidences if they are set

        Returns
        -------
        dict: Evidences with keys as nodes.
        """
        return self.evidences

    def clear_evidences(self):
        """Clear evidences

        """
        self.evidences = dict.fromkeys(self.nodes)

    def get_network_object(self):
        """
        Get NetworkX object

        Returns
        -------
        object: NetworkX instance of graph

        """
        return self.g
    
    def network_to_pandas(self):
        """
        Returns network in pandas format
        """
        return nx.to_pandas_dataframe(self.g)

    def network_summary(self):
        """
        Summary of each nodes in network.

        Returns
        -------
        Dataframe: Summary

        """
        summary_cols = ["Node", "Mean", "Std", "Parents", "Children"]
        summary = pd.DataFrame(columns=summary_cols)
        for node in self.nodes:
            row = [
                node,
                round(self.data[node].mean(), 4),
                round(self.data[node].std(), 4),
                self.get_parents(node),
                self.get_children(node),
            ]
            summary.loc[len(summary)] = row
        return summary

    def draw_network(self, filename, graph=None,correlation_annotation=True,open=True):
        """Draw Network using Graphviz and PyDot.

        This method used Graphviz library to draw graphs, so Graphviz needs to be installed.

        Download and install it from here : https://graphviz.gitlab.io/download/
        You might need to add environment variable for Graphviz.

        Parameters
        ----------
        filename: Image will wil stored with this filename.
        graph: Graph instance to plot. Not needed if plotting default graph og object
        correlation_annotation: True if pearson correlation coefficient needs to be written on edges
        open: Open file after storing.

        Returns
        -------
        Doesn't return anything but plots network if open=True

        """

        if graph is None:
            graph=self.g

        for edge in list(graph.edges):
            if correlation_annotation:
                graph.edges[edge[0],edge[1]]['label'] = str(round(self.data[[edge[0],edge[1]]].corr().iloc[0,1],1))
            graph.edges[edge[0], edge[1]]['fontname'] = 'Arial'
            graph.edges[edge[0], edge[1]]['fontsize'] = 10

        for node in graph.nodes:
            graph.nodes[node]['fontname'] = 'Arial'

        nx.drawing.nx_pydot.to_pydot(graph).write_png(filename + ".png")
        if open:
            # Import plotting libraries only if required
            import matplotlib.pyplot as plt
            import matplotlib.image as mpimg
            import matplotlib as mpl

            mpl.rcParams["figure.dpi"] = len(self.nodes)*15
            img = mpimg.imread(filename + ".png")
            plt.imshow(img)
            plt.show()

    def plot_distributions(self, save=False, filename=None):
        """KDE Plot of all the variables along with mean and standard deviation


        Parameters
        ----------
        save: Boolean, True saved image to directory
        filename: Name of File if saving.

        Returns
        -------
        Nothing. But plots diagram.

        """

        import seaborn as sns
        import matplotlib.pyplot as plt

        columns = 5
        sns.set(font_scale=1.0)
        rows = math.ceil(len(self.data.columns) / columns)
        fig, ax = plt.subplots(ncols=columns, nrows=rows, figsize=(12, rows * 2))

        fig.tight_layout()
        for idx, axis in enumerate(ax.flatten()):
            sns.distplot(
                self.data.iloc[:, idx].dropna(), norm_hist=False, ax=axis, label=""
            )

            axis.set_title(self.data.columns[idx])
            axis.set_xlabel("")

            axis.yaxis.set_major_formatter(plt.NullFormatter())
            plt.text(
                0.2,
                0.8,
                f"u:{round(self.data.iloc[:, idx].mean(), 2)}\nsd={round(self.data.iloc[:, idx].std(), 2)}",
                ha="center",
                va="center",
                transform=axis.transAxes,
            )
            if idx == len(self.data.columns) - 1:
                break
        plt.subplots_adjust(hspace=0.4, wspace=0.1)
        if save:
            plt.savefig(filename + ".png")
        plt.show()

class LinearGaussian(Graph):
    """
    Implemented Linear Gaussian Algorithm
    """

    def __init__(self):
        """
        Inherits base graph methods from Graph
        """
        super().__init__()

    def __get_node_values(self, node):
        """
    Get mean and variance of node using Linear Gaussian CPD. Calculated by finding betas
    """
        index_to_keep = [self.nodes.index(node)]
        index_to_reduce = [self.nodes.index(idx) for idx in list(self.g.pred[node])]
        values = self.__get_parent_calculated_means(list(self.g.pred[node]))
        val = {n: round(v, 3) for n, v in zip(list(self.g.pred[node]), values)}

        mu_j = self.mean[index_to_keep]
        mu_i = self.mean[index_to_reduce]

        sig_i_j = self.cov[np.ix_(index_to_reduce, index_to_keep)]
        sig_j_i = self.cov[np.ix_(index_to_keep, index_to_reduce)]
        sig_i_i_inv = np.linalg.inv(self.cov[np.ix_(index_to_reduce, index_to_reduce)])
        sig_j_j = self.cov[np.ix_(index_to_keep, index_to_keep)]

        covariance = sig_j_j - np.dot(np.dot(sig_j_i, sig_i_i_inv), sig_i_j)
        beta_0 = mu_j - np.dot(np.dot(sig_j_i, sig_i_i_inv), mu_i)
        beta = np.dot(sig_j_i, sig_i_i_inv)

        new_mu = beta_0 + np.dot(beta, values)

        node_values = {n: round(v, 3) for n, v in zip(list(self.g.pred[node]), values)}
        node_beta = list(np.around(np.array(list(beta_0) + list(beta[0])), 2))
        self.parameters[node] = {"node_values": node_values, "node_betas": node_beta}

        return new_mu[0], covariance[0][0]

    def __get_parent_calculated_means(self, nodes):
        """
    Get evidences of parents given node name list
    """
        pa_e = []
        for node in nodes:
            ev = self.calculated_means[node]
            if ev is None:
                ev = self.mean[self.nodes.index(node)]
            pa_e.append(ev)
        return pa_e

    def get_model_parameters(self):
        """
    Get parameters for each node
    """
        return self.parameters

    def __build_results(self):
        """
        Make Pandas dataframe with the results.

        """

        self.inf_summary = pd.DataFrame(
            index=self.nodes,
            columns=[
                "Evidence",
                "Mean",
                "Mean_inferred",
                "Variance",
                "Variance_inferred",
            ],
        )

        self.inf_summary.loc[:, "Mean"] = self.mean
        self.inf_summary["Evidence"] = self.inf_summary.index.to_series().map(
            self.evidences
        )
        self.inf_summary.loc[:, "Variance"] = list(np.around(np.diag(self.cov),3))

        self.inf_summary["Mean_inferred"] = self.inf_summary.index.to_series().map(
            self.calculated_means
        )
        self.inf_summary["Variance_inferred"] = self.inf_summary.index.to_series().map(
            self.calculated_vars
        )
        self.inf_summary["u_%change"] = (
            (self.inf_summary["Mean_inferred"] - self.inf_summary["Mean"])
            / self.inf_summary["Mean"]
        ) * 100

        self.inf_summary = (
            self.inf_summary.round(4)
            .replace(np.nan, "", regex=True)
            .replace(0, "", regex=True)
        )

        return self.inf_summary

    def __get_pure_root_nodes(self, graph):
        root_nodes = [
            x
            for x in graph.nodes()
            if graph.out_degree(x) >= 1 and graph.in_degree(x) == 0
        ]

        children_of_root_nodes = []
        for node in root_nodes:
            children_of_root_nodes.extend(list(graph.succ[node]))

        pure_children = []
        for node in children_of_root_nodes:
            node_parents = list(graph.pred[node])
            flag = False
            for parent in node_parents:
                if graph.in_degree(parent) != 0:
                    flag = True
            if not flag:
                pure_children.append(node)
        return list(set(pure_children))

    def __remove_pred_edges(self, node, graph):
        preds = graph.pred[node]
        for parent in list(preds):
            graph.remove_edge(parent, node)

    def run_inference(self, debug=True, return_results=True):
        """
        Run Inference on network with given evidences.
        """
        g_temp = copy.deepcopy(self.g)

        self.parameters = dict.fromkeys(self.nodes)
        self.calculated_means = copy.deepcopy(self.evidences)
        self.calculated_vars = dict.fromkeys(self.nodes)
        self.done_flags = dict.fromkeys(self.nodes)

        it=0
        while not nx.is_empty(g_temp):
            it+=1
            pure_children = self.__get_pure_root_nodes(g_temp)
            for child in pure_children:
                if self.evidences[child] is None:
                    self.calculated_means[child], self.calculated_vars[child] = self.__get_node_values(child)

                g_temp.remove_nodes_from(list(g_temp.pred[child]))

        return self.__build_results()

    def get_inference_results(self):
        """Get inference result

        Returns
        -------
        dataframe: Dataframe with inference results.

        """
        return self.inf_summary