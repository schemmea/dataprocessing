from pyexpat.errors import XML_ERROR_ATTRIBUTE_EXTERNAL_ENTITY_REF
import sys
import os
from typing import Dict, List, Any
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns



def p2f(value: str) -> float:
    return float(value.strip('%'))


def process_plot_data(path: str, algorithm: str, reindexsteps: int = 10) -> pd.DataFrame:
    ps=os.path.join(path, 'plot_data')
    print(ps)
    time_axis = "# unix_time"
    threshhold=3600 #seconds	
    if algorithm == "afl":
        data = pd.read_csv(ps, sep=",", skipinitialspace=True,
                       converters={"valid_cov": p2f, "map_size": p2f})
    else:
        data = pd.read_csv(ps, sep=",", skipinitialspace=True)

    if data.empty: return None, None

    data[time_axis] -= data[time_axis][0]
    data['total_inputs'] = data['valid_inputs'] + data['invalid_inputs']
    data['total_inputs'] -= data["total_inputs"][0]
    
    data = data[data[time_axis] < threshhold]

    x_axis = time_axis
    time_based_data = data.copy().drop_duplicates(
        keep='first', subset=[x_axis])
    
    rolling_time_based_data = time_based_data.copy()
    rolling_time_based_data['algorithm'] = [algorithm] * rolling_time_based_data.shape[0]
    
    time_based_data = time_based_data.set_index(x_axis).reindex(
       range(1, time_based_data[x_axis].max(), reindexsteps)).interpolate().reset_index()
    time_based_data['algorithm'] = [algorithm] * time_based_data.shape[0]


    x_axis = "total_inputs"
    count_based_data = data.copy().drop_duplicates(
        keep='first', subset=[x_axis])
    
    count_based_data = count_based_data.set_index(x_axis).reindex(
       range(0, count_based_data[x_axis].max(), reindexsteps)).interpolate().reset_index()
    count_based_data['algorithm'] = [algorithm] * count_based_data.shape[0]

    return time_based_data, rolling_time_based_data, count_based_data

def process_cov_data(path: str) -> List[str]:
    with open(path) as f:
        return f.readlines()

def add_rolling_mean( data : pd.DataFrame, rolling : int = 10) -> pd.DataFrame:
    
    # rolling mean to valid_covered_probes
    data[f'rolling_{rolling}_valid_covered_probes'] = data['valid_covered_probes'].rolling(rolling).mean()
    
    # rolling mean to all_covered_probes
    data[f'rolling_{rolling}_all_covered_probes'] = data['all_covered_probes'].rolling(rolling).mean()
    
    # rolling mean to total_inputs
    data[f'rolling_{rolling}_total_inputs'] = data['total_inputs'].rolling(rolling).mean()
   
    return data


def generate_plot_data_base(path: str, data: pd.DataFrame, rolling_data:pd.DataFrame, x_axis: str, y_axis: str, rolling_mean:int =10,  errorbarname: str = 'se'):
    print(x_axis, y_axis)
    fig, ax1 = plt.subplots(figsize=(12,6))
    ax2 = ax1.twinx()

    if errorbarname == 'se':
        lineplot1 = sns.lineplot(x=x_axis, y=y_axis, hue='algorithm', errorbar="se", hue_order=sorted(data['algorithm'].unique()), data=data, ax=ax1)
   
    elif errorbarname == 'sd':
        lineplot1 = sns.lineplot(x=x_axis, y=y_axis, hue='algorithm', errorbar=("sd",95), hue_order=sorted(data['algorithm'].unique()), data=data, ax=ax1)    

    lineplot2 = sns.lineplot(x=x_axis, y=f"rolling_{rolling_mean}_{y_axis}", hue='algorithm', errorbar=None, hue_order=sorted(data['algorithm'].unique()), data=rolling_data, ax=ax2, linestyle="dotted")

    ax1.set_xlabel(x_axis)
    ax1.set_ylabel(y_axis)
    ax2.set_ylabel(f"rolling_{rolling_mean}_{y_axis}")

    #fig = ax2.get_figure()
    #  fig.savefig(path)
    #fig.clf()
    return ax2

def generate_valid_coverage_over_time(          path: str, data: pd.DataFrame, rolling_data: pd.DataFrame, rolling_mean, errorbarname: str = 'se'):
    return generate_plot_data_base(path, data, rolling_data, "# unix_time", "valid_covered_probes", rolling_mean, errorbarname)

def generate_all_coverage_over_time(            path: str, data: pd.DataFrame, rolling_data: pd.DataFrame, rolling_mean, errorbarname: str = 'se'):
    return generate_plot_data_base(path, data, rolling_data,  "# unix_time", "all_covered_probes", rolling_mean, errorbarname)

def generate_total_inputs_over_time(            path: str, data: pd.DataFrame, rolling_data: pd.DataFrame, rolling_mean, errorbarname: str = 'se'):
    return generate_plot_data_base(path, data, rolling_data,  "# unix_time", "total_inputs", rolling_mean, errorbarname)

def generate_valid_coverage_over_total_inputs(  path: str, data: pd.DataFrame, rolling_data: pd.DataFrame, rolling_mean, errorbarname: str = 'se'):
    return generate_plot_data_base(path, data, rolling_data, "total_inputs", "valid_covered_probes", rolling_mean, errorbarname)

def generate_all_coverage_over_total_inputs(    path: str, data: pd.DataFrame, rolling_data: pd.DataFrame, rolling_mean, errorbarname: str = 'se'):
    return generate_plot_data_base(path, data, rolling_data, "total_inputs", "all_covered_probes", rolling_mean, errorbarname)

def show_values_on_bars(axs):
    def _show_on_single_plot(ax):
        for p in ax.patches:
            _x = p.get_x() + p.get_width() / 2
            _y = p.get_y() + p.get_height() + 10
            value = str(int(p.get_height()))
            ax.text(_x, _y, value, ha="center")

    if isinstance(axs, np.ndarray):
        for _, ax in np.ndenumerate(axs):
            _show_on_single_plot(ax)
    else:
        _show_on_single_plot(axs)

def generate_total_coverage_bar(path: str, data: Dict[str, List[Any]]):
    axis = sns.barplot(x="type", y="value", hue="algo", data=data)
    show_values_on_bars(axis)
    #fig = axis.get_figure()
    #fig.savefig(path)
    #fig.clf()
    return axis



