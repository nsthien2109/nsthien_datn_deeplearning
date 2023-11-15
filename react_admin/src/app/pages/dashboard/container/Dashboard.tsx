import React from 'react';
import { Card } from 'antd';

import CardStatistic from '../components/CardStatistic';
import { ChartStatistic } from '../components/ChartStatistic';

import accountIcon from '../../../../assets/svgs/account.svg';
import birdIcon from '../../../../assets/svgs/bird.svg';
import aiIcon from '../../../../assets/svgs/ai.svg';

const Dashboard: React.FC = () => (
  <>
    <div className="dashboard">
      <div className="dashboard-wrapper">
        <div className="grid grid-cols-3 gap-4 mb-10 dashboard-stats-grid">
          <CardStatistic icon={accountIcon} title="Accounts" statistic={1231} />
          <CardStatistic icon={birdIcon} title="Birds" statistic={524} />
          <CardStatistic icon={aiIcon} title="Predictions" statistic={62} />
        </div>
        <div className="grid grid-cols-2 gap-5 dashboard-chart">
          <div className="flex-1">
            <Card>
              <ChartStatistic />
            </Card>
          </div>
          <div className="flex-1">
            <Card>
              <ChartStatistic />
            </Card>
          </div>
        </div>
      </div>
    </div>
  </>
);

export default Dashboard;
